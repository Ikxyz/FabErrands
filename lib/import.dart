export 'package:fab_errands/app.dart';
export 'package:fab_errands/classes/auth.dart';
export 'package:fab_errands/classes/classes.dart';
export 'package:fab_errands/classes/custom-clip.dart';
export 'package:fab_errands/classes/message_class.dart';
export 'package:fab_errands/classes/notification_class.dart';
export 'package:fab_errands/classes/payment_class.dart';
export 'package:fab_errands/classes/start_up.dart';
export 'package:fab_errands/classes/user_contact_class.dart';
export 'package:fab_errands/classes/user_profile_class.dart';
export 'package:fab_errands/trigger/event.dart';
export 'package:fab_errands/classes/route_animations.dart';
export 'package:fab_errands/models/app.dart';
export 'package:fab_errands/styles/styles.dart';
export 'package:fab_errands/routes/login.dart';
export 'package:fab_errands/routes/register.dart';
export 'package:fab_errands/routes/search_screen.dart';
export 'package:fab_errands/routes/profile_screen.dart';
export 'package:fab_errands/trigger/event.dart';
export 'package:fab_errands/routes/home.dart';
export 'classes/start_up.dart';

/// Platform APIs
export 'dart:convert';
export 'dart:math';

/// Firebase/Other APIS
export 'package:fab_errands/classes/user_profile_class.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:bloc/bloc.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:cached_network_image/cached_network_image.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final db = Firestore.instance;
void enableOfflineMode() {
  db.settings(persistenceEnabled: true);

}

FirebaseUser firebaseUser;
final never = auth.onAuthStateChanged.listen((x) {
  firebaseUser = x;
});
FirebaseUser get userAuth => firebaseUser;
