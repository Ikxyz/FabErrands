import 'package:fab_errands/trigger/event.dart' as event$;
import 'package:fab_errands/import.dart';

class $AppAuthState extends Bloc<event$.isAutheticated, dynamic> {
  @override
  dynamic get initialState => false;
  final BuildContext context;
  FirebaseUser _user;
  final _auth = FirebaseAuth.instance;
  $AppAuthState(this.context);
  @override
  Stream<dynamic> mapEventToState(event$.isAutheticated event) async* {
    _user = await FirebaseAuth.instance.currentUser();
    print('Trigger: $event; USER $_user');
    // if (_user == null) {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
    // }

    ///Listen for auth state (sign in and out event)
    if (event == event$.isAutheticated.listen) {
      if (_user == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      }
      yield* _authState();
    }

    //Lsten for user sign out
    if (event == event$.isAutheticated.signOut) {
      yield* _authSignOut();
    }

    /// fetch User Data
    if (event == event$.isAutheticated.userData) {
      yield* _userData(_user);
    }
  }

  Stream<UsersProfileClass> _userData(user) async* {
    if (user != null) {
      final data =
          await Firestore().collection('user').document(user.uid).get();
      yield UsersProfileClass.fromJson(data.data);
    }
  }

  Stream<FirebaseUser> _authState() async* {
    _user = await FirebaseAuth.instance.currentUser();

    yield _user;
  }

  Stream<FirebaseUser> _authSignOut() async* {
    await _auth.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}

class $AppState extends Bloc<event$.window, dynamic> {
  @override
  get initialState => _windowKey;
  GlobalKey<ScaffoldState> _windowKey = GlobalKey<ScaffoldState>();

  @override
  Stream mapEventToState(event$.window events) {
    if (events == event$.window.add) {}
    if (events == event$.window.update) {}
    if (events == event$.window.get) {
      return Stream.fromFuture(Future.value(_windowKey));
    }
    return Stream.fromFuture(Future.value(_windowKey));
  }

  GlobalKey<ScaffoldState> window() {
    return _windowKey;
  }

  GlobalKey<ScaffoldState> addWindowState() {
    return _windowKey;
  }
}

class $AppNavigationState extends Bloc<event$.navigationBarEvent, int> {
  @override
  int get initialState => 0;
  int _currentState = 0;

  @override
  Stream<int> mapEventToState(event$.navigationBarEvent event) async* {
    print('Me too oooo $_currentState');
    yield _currentState;
  }

  void currentIndex(int e) {
    _currentState = e;
    mapEventToState(navigationBarEvent.get);
    print('I have done my job $_currentState');
  }
}
