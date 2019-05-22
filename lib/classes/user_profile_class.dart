import 'package:flutter/material.dart';

class UsersProfileClass {
  String firstName,
      lastName,
      email,
      tel,
      address,
      city,
      state,
      pwd,
      retypePwd,
      country,
      zip,
      passport,
      identification,
      utilityBill,
      uid;
  int time, likes, followers, following, rating;
  double latitude, longitude;
  bool isAdmin, isAgent, isMember, isDev, isVerified, isOrg;
  dynamic online;
  UsersProfileClass(
      {@required this.email,
      @required this.address,
      this.uid,
      this.firstName,
      this.lastName,
      this.state,
      this.tel,
      this.retypePwd,
      this.pwd,
      this.isAdmin,
      this.isAgent,
      this.isOrg,
      this.isDev,
      this.isMember,
      this.city,
      this.country,
      this.zip,
      this.passport,
      this.identification,
      this.utilityBill,
      this.time,
      this.rating,
      this.online,
      this.likes,
      this.followers,
      this.following,
      this.isVerified,
      this.latitude,
      this.longitude});

  factory UsersProfileClass.fromJson(Map map) {
    if (map == null) return null;
    return UsersProfileClass(
        firstName: map['firstName'],
        lastName: map['lastName'],
        email: map['email'],
        pwd: map['pwd'],
        retypePwd: map['retypePwd'],
        tel: map['tel'],
        state: map['state'],
        address: map['address'],
        isAdmin: map['isAdmin'],
        isAgent: map['isAgent'],
        isDev: map['isDev'],
        isOrg: map['isOrg'],
        rating: map['rating'],
        isMember: map['isMember'],
        city: map['city'],
        country: map['country'],
        zip: map['zip'],
        passport: map['passport'],
        identification: map['identification'],
        utilityBill: map['utility_bill'],
        uid: map['uid'],
        time: map['time'],
        likes: map['likes'],
        followers: map['followers'],
        following: map['following'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        isVerified: map['isVerified'],
        online: map['online']);
  }

  static Map<String, dynamic> toJson(UsersProfileClass e) {
    return {
      'firstName': e.firstName,
      'lastName': e.lastName,
      'address': e.address,
      'email': e.email,
      'state': e.state,
      'tel': e.tel,
      'retypePwd': e.retypePwd,
      'pwd': e.pwd,
      'isAdmin': e.isAdmin,
      'isAgent': e.isAgent,
      'isOrg': e.isOrg,
      'isDev': e.isDev,
      'isMember': e.isMember,
      'city': e.city,
      'country': e.country,
      'zip': e.zip,
      'passport': e.passport,
      'identification': e.identification,
      'utilityBill': e.utilityBill,
      'uid': e.uid,
      'time': e.time,
      'rating': e.rating,
      'online': e.online,
      'likes': e.likes,
      'followers': e.followers,
      'following': e.following,
      'isVerified': e.isVerified,
      'latitude': e.latitude,
      'longitude': e.longitude
    };
  }

    String toStr() {
 
    return ''' 

     firstName: ${this.firstName},
        lastName: ${this.lastName},
        email: ${this.email},
        pwd: ${this.pwd},
        retypePwd: ${this.retypePwd},
        tel: ${this.tel},
        state: ${this.state},
        address: ${this.address},
        isAdmin: ${this.isAdmin},
        isAgent: ${this.isAgent},
        isDev: ${this.isDev},
        isOrg: ${this.isOrg},
        rating: ${this.rating},
        isMember: ${this.isMember},
        city: ${this.city},
        country: ${this.country},
        zip: ${this.zip},
        passport: ${this.passport},
        identification: ${this.identification},
        utilityBill: ${this.utilityBill},
        uid: ${this.uid},
        time: ${this.time},
        likes: ${this.likes},
        followers: ${this.followers},
        following: ${this.following},
        latitude: ${this.latitude},
        longitude: ${this.longitude},
        isVerified: ${this.isVerified},
        online: ${this.online}
               
     ''';
  }
}
