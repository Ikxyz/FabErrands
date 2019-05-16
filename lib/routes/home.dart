import 'package:fab_errands/import.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: $AppState().mapEventToState(window.get),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null) {
            return isLoading(context);
          }
          print('Intended Scffold Key ${snapshot.data}');

          List<Widget> _Pages = <Widget>[
            ErrandFeedComponent(SearchBarComponent(snapshot.data))
          ];

          return Scaffold(
            appBar: null,
            key: snapshot.data,
            body: Container(
              child: _Pages[_currentPageIndex],
            ),
            bottomNavigationBar: BottomNavigationComponent(),
            drawer: DrawerComponent(),
          );
        }

        return isLoading(context);
      },
    );
  }

  int _currentPageIndex = 0;

  get _floatingActionButton => RotatedBox(
        quarterTurns: 3,
        child: RaisedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: Text(
            'Post Errand',
            style: TextStyle(color: Colors.white),
          ),
          shape: StadiumBorder(),
        ),
      );
}
