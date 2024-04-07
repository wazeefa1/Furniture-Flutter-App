import 'package:flutter/material.dart';

class AppConfig {
  // static const String hostUrl = 'https://spn21.spondan.com/amazcart';
  static const String hostUrl = 'https://demo.wazeefa.in/cam';
  // static const String hostUrl = 'https://cam.tikkabahraini.com';
  // static const String hostUrl = 'https://ezviz.com';

  static String appName = 'Ezviz';

  static String loginBackgroundImage = 'assets/config/login_bg.png';

  static String appLogo = 'assets/config/splash_screen_logo.png';

  static String appBanner = 'assets/config/app_banner.jpg';

  static const String assetPath = hostUrl + '/public';

  // static Color loginScreenBackgroundGradient1 = Color(0xffFF3566);
  static Color loginScreenBackgroundGradient1 = Color(0xff549cff);

  // static Color loginScreenBackgroundGradient2 = Color(0xffD7365C);
  static Color loginScreenBackgroundGradient2 = Color(0xff549cff);

  // static String appColorScheme = "#FF3364";
  static String appColorScheme = "#549cff";

  // static const String privacyPolicyUrl =
  //     'https://spn21.spondan.com/amazcart/privacy-policy';

  static const String privacyPolicyUrl =
      'https://demo.wazeefa.in/cam/privacy-policy';

  static bool googleLogin = false;

  static bool facebookLogin = false;

  static bool isDemo = false;

  static String tabbyMerchantCode = 'FONCY';
}
