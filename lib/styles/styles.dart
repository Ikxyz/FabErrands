import 'package:flutter/material.dart';

/// return a form field text style
get registerFormTextStyle => TextStyle(fontSize: 18);

/// return a form field text style
get loginFormTextStyle => TextStyle(
      fontSize: 20,
    );

Widget textInputHeader({@required String title, trailing: ''}) => Container(
      color: Colors.grey[100].withOpacity(.4),
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 0.0,
        right: 16.0,
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontFamily: 'QuickSand'),
          ),
          Text(
            trailing,
            style: TextStyle(
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
