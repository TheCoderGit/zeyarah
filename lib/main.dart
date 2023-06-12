//TODO:: build the trip action
//TODO:: trip details screen
//TODO:: multi language support
//TODO:: add apple pay support to apple application

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zeyarah/app/android_app.dart';
import 'package:zeyarah/app/another_app.dart';
import 'package:zeyarah/app/web_app.dart';
import 'package:zeyarah/core/firebase_options.dart';
import 'package:zeyarah/app/ios_app.dart';
import 'package:zeyarah/core/user_shared_prefs.dart';

void main() async {
  //first initializing for all the needed liberaries in the start up
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialize the shared preferences
  await UserSharedPrefs.init();

  //chcek the running system to specialize the screens
  //android
  if (kIsWeb){
    runApp(const WebApp());
    print('web');
  }else{
    if (defaultTargetPlatform == TargetPlatform.android) {
      runApp(const AndroidApp());
      print('android');
      //ios
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      runApp(const IosApp());
      print('IOS');
      // using ios for mac also
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      runApp(const IosApp());
      print('macOS');
      //any thing esle will use the sam app of android
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      runApp(const AnotherApp());
      print('Linux');
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      runApp(const AnotherApp());
      print('windows');
    } else if (defaultTargetPlatform == TargetPlatform.fuchsia) {
      runApp(const AnotherApp());
      print('fuchsia');
    }
  }

}
