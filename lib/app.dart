import 'package:fab_errands/routes/home.dart';

import 'import.dart';

class FadErrand extends StatelessWidget {


  
  
  
  
  bool _isAuth;
  
  
  Widget _initialRoute;





  FadErrand(this._isAuth) {
    _initialRoute = _isAuth ? HomeRoute(): LoginRoute();
  }




  Widget build(BuildContext context) {
    _widget() => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(),
          home: _initialRoute,
          onGenerateRoute: (RouteSettings settings) {
            if (settings.name == '/home') {
              return MaterialPageRoute(builder: (context) {
                return HomeRoute();
              });
            } else if (settings.name.startsWith("startupInfo")) {
              final param = settings.name.split("/")[1];
              print('Route paramter: $param');
              return SlideLeftRoute(builder: (context) {
                return Offstage();
              });
            } else if (settings.name.startsWith('startup')) {
              final param = int.parse(settings.name.split("/")[1]);

              return FadeInRoute(builder: (context) {
                return Offstage();
              });
            } else if (settings.name == '/addStartup') {
              return FadeInRoute(builder: (context) {
                return Offstage();
              });
            } else if (settings.name.startsWith("startupInfo")) {
              final param = settings.name.split("/")[1];
              print('Route paramter: $param');
              return SlideLeftRoute(builder: (context) {
                return Offstage();
              });
            } else if (settings.name == "/search") {
              return FadeInRoute(builder: (context) {
                return Offstage();
              });
            } else if (settings.name == "/login") {
              return FadeInRoute(builder: (context) {
                return LoginRoute();
              });
            }
          },
        );

    return _widget();
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: Colors.teal.shade900,
    primaryColor: Colors.teal.shade900,
    //buttonColor: Colors.brown.shade900,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textSelectionColor: Colors.tealAccent,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    //primaryIconTheme: base.iconTheme.copyWith(color: Colors.brown.shade900),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    indicatorColor:Colors.teal,
    iconTheme: _customIconTheme(base.iconTheme),
    bottomAppBarColor: Colors.white,
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: Colors.grey);
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
          fontFamily: 'QuickSand',
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          fontFamily: 'QuickSand',
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          fontFamily: 'Raleway',
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          fontFamily: 'Raleway',
        ),
      )
      .apply(
        fontFamily: 'QuicksSand',
        //displayColor: Colors.brown.shade900,
        //bodyColor: Colors.brown.shade900,
      );
}
