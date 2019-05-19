import 'package:fab_errands/import.dart';

class ErrandClass {
  String title, errandLocation, errandDesc;
  UsersProfileClass owner, runner;
  dynamic image,
      amount,
      tag,
      postTimeStamp,
      acceptTimeStamp,
      terminateTimeStamp,
      completeTimeStamp;

  ErrandClass(
      {this.title,
      this.errandLocation,
      this.errandDesc,
      this.owner,
      this.runner,
      this.image,
      this.amount,
      this.postTimeStamp,
      this.tag});

  factory ErrandClass.fromJson(Map<String, dynamic> map) {
    return ErrandClass(
        title: map['title'],
        errandDesc: map['errandDesc'],
        errandLocation: map['errandLocation'],
        amount: map['amount'],
        image: map['image'],
        tag: map['tag'],
        owner: map['owner'],
        runner: map['runner']);
  }
  static Map<String, dynamic> toJson(ErrandClass e) {
    return {
      'title': e.title,
      'errandLocation': e.errandLocation,
      'errandDesc': e.errandDesc,
      'owner': e.owner,
      'runner': e.runner,
      'image': e.image,
      'amount': e.amount,
      'tag': e.tag,
    };
  }
}
