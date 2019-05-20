import 'package:flutter/material.dart';

class UsersContacts {
  String uid;
  String time;
  UsersContacts({@required uid, @required time});

  factory UsersContacts.fromJson(Map map) {
    return UsersContacts(time: map['time'], uid: map['uid']);
  }
}
