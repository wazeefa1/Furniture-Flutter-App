import 'dart:io';

import 'package:amazcart/AppConfig/api_keys.dart';
import 'package:amazcart/bindings/home_bindings.dart';
import 'package:amazcart/AppConfig/app_config.dart';
import 'package:amazcart/view/MainNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

import 'AppConfig/language/language_selection.dart';
import 'AppConfig/language/translation.dart';

var language;
bool langValue = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  TabbySDK().setup(
    withApiKey: 'pk_test_ec208bef-3e27-45aa-a6b5-1807d238e950', // Put here your Api key
    // environment: Environment.stage, // Or use Environment.production
  );

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  await GetStorage.init();
  await Hive.initFlutter();

  final sharedPref = await SharedPreferences.getInstance();
  language = sharedPref.getString('language');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  configLoading();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LanguageController languageController = Get.put(LanguageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale:
          langValue ? Get.deviceLocale : Locale(LanguageSelection.instance.val),
      builder: EasyLoading.init(),
      translations: LanguageController(),
      fallbackLocale: Locale('en_US'),
      title: AppConfig.appName,
      initialBinding: HomeBindings(),
      // getPages: routes,
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MainNavigation(
        navIndex: 0,
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskColor = Colors.transparent
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.transparent
    ..textColor = Colors.transparent
    ..userInteractions = true
    ..progressColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..dismissOnTap = false;
}

