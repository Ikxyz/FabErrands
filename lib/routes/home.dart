import 'package:fab_errands/components/active_errand_feed.dart';
import 'package:fab_errands/components/history.dart';
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
            ErrandFeedComponent(
                SearchErrandByLocationBarComponent(snapshot.data)),
            ActiveErrandsComponent(),
            HistoryComponent()
          ];

          return Scaffold(
            appBar: null,
            key: snapshot.data,
            body: Container(
              child: _Pages[_currentPageIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_run),
                  title: Text('Errands'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  title: Text('Active Errands'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), title: Text('History')),
              ],
              elevation: 0,
              currentIndex: _currentPageIndex,
              onTap: (e) {
                setState(() {
                  _currentPageIndex = e;
                });
              },
            ),
            drawer: DrawerComponent(),
            floatingActionButton: _floatingActionButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            primary: true,
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: true,
          );
        }

        return isLoading(context);
      },
    );
  }

  int _currentPageIndex = 0;

  get _floatingActionButton => FloatingActionButton(
      onPressed: () {},
      mini: true,
      backgroundColor: Theme.of(context).indicatorColor,
      child: Icon(
        Icons.send,
        color: Colors.white,
      ));
}
