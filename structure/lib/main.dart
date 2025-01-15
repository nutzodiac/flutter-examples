import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/http_trust_certificate.dart';
import 'helper/navigator_service.dart';
import 'module/login/cubit/login_cubit.dart';
import 'module/mock/cubit/mock_cubit.dart';
import 'routes/routes.dart';
import 'utils/firebase/firebase.dart';
import 'utils/global.dart';
import 'utils/log.dart';
import 'utils/storage.dart';
import 'utils/theme_app_custom.dart';

advancedStatusCheck(NewVersionPlus newVersion) async {
  final status = await newVersion.getVersionStatus();
  if (status != null) {
    if (status.canUpdate) {
      newVersion.showUpdateDialog(
        context: NavigationService.navigatorKey.currentContext!,
        versionStatus: status,
        dialogTitle: "Please Update Version",
        dialogText: '',
        launchModeVersion: LaunchModeVersion.normal,
        allowDismissal: false,
      );
    }
  }
}

checUpdateStoreVersion() {
  final newVersion = NewVersionPlus(
    iOSId: '',
    androidId: '',
  );
  final ver = VersionStatus(
    appStoreLink: '',
    localVersion: '',
    storeVersion: '',
    releaseNotes: '',
    originalStoreVersion: '',
  );
  advancedStatusCheck(newVersion);
}

void main() async {
  // Firebase //
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  MyFirebase.callFirebase();
  // WebSocket //
  // WebSocket.getInstance().socketDisconnect();
  // WebSocket.getInstance().socketConnect();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = const AppBlocObserver();
  // Clear Data //
  SharedPreferences spf = await SharedPreferences.getInstance();
  bool firstRun = spf.getBool('first_run') ?? true;
  if (firstRun) {
    Storage storage = Storage.getInstance();
    // await spf.clear();
    await storage.deleteStorageAll();
    spf.setBool('first_run', false);
  }
  runApp(const MyApp());
}

void getAppLinks() {
  final appLinks = AppLinks();
  final sub = appLinks.uriLinkStream.listen((uri) {
    // print('onAppLink: $uri');
    openAppLink(uri);
  });
}

void openAppLink(Uri uri) async {
  String? token = await Storage.getInstance().getToken();
  if (token == null) {
    if (Global.currentRoute != "register") {
      NavigationService.navigatorKey.currentContext!.go('/register');
    } else {
      NavigationService.navigatorKey.currentContext!.go(uri.fragment);
    }
  }
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  const MyApp({super.key});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      // WebSocket.getInstance().isPaused = true;
      // WebSocket.getInstance().socketDisconnect();
    } else if (state == AppLifecycleState.resumed) {
      // WebSocket.getInstance().isPaused = true;
      // WebSocket.getInstance().socketDisconnect();
    } else if (state == AppLifecycleState.detached) {
      // WebSocket.getInstance().isPaused = true;
      // WebSocket.getInstance().socketDisconnect();
    } else if (state == AppLifecycleState.paused) {
      // WebSocket.getInstance().isPaused = true;
      // WebSocket.getInstance().socketDisconnect();
    }
    super.didChangeAppLifecycleState(state);
  }
  
  @override
  Widget build(BuildContext context) {

    // getAppLinks();

    WidgetsBinding.instance.addObserver(this);

    final mockCubit = BlocProvider<MockCubit>(lazy: false, create: (_) => MockCubit());
    final loginCubit = BlocProvider<LoginCubit>(lazy: false, create: (_) => LoginCubit());

    return MultiBlocProvider(
      providers: [
        mockCubit,
        loginCubit,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: MyRouter.build,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: ThemeAppCustom.primaryColor,
          fontFamily: "IBMPlexSansThai",
          fontFamilyFallback: const ["IBMPlexSansThai"],
        ),
        locale: const Locale('en', 'US'),
        localeResolutionCallback: (
          locale,
          supportedLocales,
        ) {
          return locale;
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('th', ''),
        ],
      ),
    );
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) Log.d(change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    Log.d(transition);
  }
}