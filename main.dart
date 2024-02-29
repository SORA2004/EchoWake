import 'package:echowake/app/app.bottomsheets.dart';
import 'package:echowake/app/app.dialogs.dart';
import 'package:echowake/app/app.locator.dart';
import 'package:echowake/app/app.router.dart';
import 'package:echowake/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'; // kDebugMode를 위해 추가
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 디버그 모드의 경우  AndroidProvider.debug 을 사용함
  // Firebase 콘솔에서 debug token을 등록함
  const androidProvider =
      kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity;
  await FirebaseAppCheck.instance.activate(
    androidProvider: androidProvider,
  );

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        colorScheme: const ColorScheme.light(
          background: Colors.white,
        ),
      ),
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
