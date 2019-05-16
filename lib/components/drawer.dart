import 'package:fab_errands/import.dart';

class DrawerComponent extends StatelessWidget {
  $AppState _state = $AppState();

  Future<Widget> DrawerButtonComponent(VoidCallback fun) async {
    return IconButton(
      icon: Icon(Icons.dehaze),
      onPressed: fun,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'FAD ERRANDS',
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.teal),
            ),
          )
        ],
      ),
      elevation: 0,
    );
  }
}
