import 'package:fab_errands/import.dart';

class TmpActiveErrandFeedComponent extends StatelessWidget {
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
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        '362 errands',
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        '# 2000.00',
                        style: Theme.of(context).textTheme.subhead.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Hey i '
                'want to help me get some drocrys from the mall am really '
                'tried, ',
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10.0),
              child: Text(
                '00:00:00',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.check),
                    onPressed: () {},
                    label: Text('Complete Errand'),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.clear),
                    textColor: Colors.red,
                    onPressed: () {},
                    label: Text('Terminate Errand'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
