import 'import.dart';

void main() async {
  final _user = await auth.currentUser();
  final bool _isAuth = _user == null ? false : true;

  runApp(FadErrand(_isAuth));
}
