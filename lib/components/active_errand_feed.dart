import 'package:fab_errands/import.dart';

class ActiveErrandsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TmpActiveErrandFeedComponent(),
          TmpActiveErrandFeedComponent(),
        ],
      ),
    );
  }
}
