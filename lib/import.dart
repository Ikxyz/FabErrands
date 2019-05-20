export 'app.dart';
export 'classes/auth.dart';
export 'classes/classes.dart';
export 'classes/custom-clip.dart';
export 'classes/message_class.dart';
export 'classes/notification_class.dart';
export 'classes/payment_class.dart';
export 'classes/start_up.dart';
export 'classes/user_contact_class.dart';
export 'classes/user_profile_class.dart';
export 'trigger/event.dart';
export 'classes/route_animations.dart';
export 'models/app.dart';
export 'styles/styles.dart';
export 'routes/login.dart';
export 'routes/register.dart';
export 'routes/search_screen.dart';
export 'routes/profile_screen.dart';
export 'trigger/event.dart';
export 'routes/home.dart';
export 'classes/start_up.dart';
export 'models/app.dart';
export 'classes/errand_class.dart';
export 'routes/post_errand.dart';

///local components

export 'components/drawer.dart';
export 'components/tmp_errand_feed.dart';
export 'components/errand_feed.dart';
export 'components/search_errand_by_location_bar.dart';
export 'components/tmp_active_errand_feed.dart';
export 'components/active_errand_feed.dart';

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
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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

Widget isLoading(context) => Container(
      width: 50,
      height: 50,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
