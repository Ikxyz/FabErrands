import 'package:fab_errands/import.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: Center(
          child: Text('Welcome home'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Public')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Public')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Public')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Public')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Public'))
      ]),
    );
  }
}
