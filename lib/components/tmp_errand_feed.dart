import 'package:fab_errands/import.dart';
import 'package:fab_errands/models/app.dart';
import 'package:flutter/material.dart';

class TemErrandFeedComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'James Enije',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(fontSize: 18),
                  ),
                  subtitle: Text(
                    '362 errands',
                    style: Theme.of(context).textTheme.subhead.copyWith(
                          fontSize: 14,
                        ),
                  ),
//                  trailing: InkWell(
//                    onTap: () {},
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        mainAxisSize: MainAxisSize.max,
//                        children: <Widget>[
//                          Icon(
//                            Icons.favorite_border,
//                            color: Colors.red,
//                          ),
//                          Expanded(
//                            child: Text('2k'),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10.0),
              child: Text(
                '''Hey i 
                want to help me get some shopping from the mall am really 
                tried, ''',
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.check),
                    onPressed: () {},
                    label: Text('Accept'),
                  ),
                  Text(
                    '# 2000.00',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
//                  FlatButton.icon(
//                    icon: Icon(Icons.location_on),
//                    onPressed: () {
//                      final m = $AppNavigationState();
//                      m.currentIndex(2);
//                      m.dispatch(navigationBarEvent.get);
//                    },
//                    label: Text(
//                      'view in map',
//                      style: Theme.of(context).textTheme.subhead,
//                    ),
//                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
