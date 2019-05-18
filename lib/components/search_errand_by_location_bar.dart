import 'package:fab_errands/import.dart';

// ignore: must_be_immutable
class SearchErrandByLocationBarComponent extends StatelessWidget {
  var _scaffoldKey;
  SearchErrandByLocationBarComponent(this._scaffoldKey) {}
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, right: 10, left: 10),
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: <Widget>[
                FutureBuilder(
                  future: DrawerComponent().DrawerButtonComponent(() {
                    onOpenDrawer(_scaffoldKey);
                  }),
                  builder: (context, doc) {
                    if (doc.hasData) {
                      return doc.data;
                    }
                    return isLoading(context);
                  },
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Seacrch '
                            'errand '
                            'location',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(style: BorderStyle.none, width: 0))),
                  ),
                  flex: 1,
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.teal,
                  ),
                  backgroundColor: Colors.grey.shade200,
                )
              ],
            ),
          ),
        ));
  }

  onOpenDrawer(_window) async {
    print('Second Intende Output $_window');
    _window.currentState.openDrawer();
  }
}
