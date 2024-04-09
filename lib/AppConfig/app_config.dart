import 'package:flutter/material.dart';

class AppConfig {
  // static const String hostUrl = 'https://spn21.spondan.com/amazcart';
  // static const String hostUrl = 'https://demo.wazeefa.in/cam';
  static const String hostUrl = 'https://demo.wazeefa.in/ezviz_furniture';
  // static const String hostUrl = 'https://cam.tikkabahraini.com';
  // static const String hostUrl = 'https://ezviz.com';

  static String appName = 'Furniture';

  static String loginBackgroundImage = 'assets/config/login_bg.png';

  static String appLogo = 'assets/config/splash_screen_logo.png';

  static String appBanner = 'assets/config/app_banner.jpg';

  static const String assetPath = hostUrl + '/public';

  // static Color loginScreenBackgroundGradient1 = Color(0xffFF3566);
  static Color loginScreenBackgroundGradient1 = Color(0xff475b3b);

  // static Color loginScreenBackgroundGradient2 = Color(0xffD7365C);
  static Color loginScreenBackgroundGradient2 = Color(0xff475b3b);

  // static String appColorScheme = "#FF3364";
  static String appColorScheme = "#475b3b";

  // static const String privacyPolicyUrl =
  //     'https://spn21.spondan.com/amazcart/privacy-policy';

  static const String privacyPolicyUrl =
      'https://demo.wazeefa.in/cam/privacy-policy';

  static bool googleLogin = false;

  static bool facebookLogin = false;

  static bool isDemo = false;

  static String tabbyMerchantCode = 'FONCY';
}
