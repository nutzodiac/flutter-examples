import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:project/utils/global.dart';
import 'package:project/utils/log.dart';

class MyFirebase {
  
  static callFirebase() async {
    const fatalError = true;
    // Non-async exceptions
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    // Async exceptions
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
    // Firebase Remote Config //
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(seconds: 60),
        ),
      );
      await remoteConfig.fetchAndActivate();
      await remoteConfig.fetch().whenComplete(() {
        if (remoteConfig.getString('baseUrl') != "") {
          Global.baseUrl = remoteConfig.getString('baseUrl');
        }
        if (remoteConfig.getString('socketurl') != "") {
          Global.socketUrl = remoteConfig.getString('socketurl');
        }
      });
      remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.fetchAndActivate();
        if (remoteConfig.getString('baseUrl') != "") {
          Global.baseUrl = remoteConfig.getString('baseUrl');
        }
        if (remoteConfig.getString('socketurl') != "") {
          Global.socketUrl = remoteConfig.getString('socketurl');
        }
      });
    } catch (e) {
      Log.d(e);
    }
  }
}