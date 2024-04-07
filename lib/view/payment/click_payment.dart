import 'dart:async';
import 'package:amazcart/AppConfig/app_config.dart';
import 'package:amazcart/view/account/orders/OrderList/MyOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import '../MainNavigation.dart';

class ClickPaymentScreen extends StatefulWidget {
  static const String routeName = "/payment_webview";

  // final String paymentUrl = "https://secure.ccavenue.com/transaction";

  final String? paymentUrl;
  ClickPaymentScreen({Key? key, this.paymentUrl}) : super(key: key);


  @override
  _ClickPaymentScreenState createState() => _ClickPaymentScreenState();
}

class _ClickPaymentScreenState extends State<ClickPaymentScreen> {
  // final Completer<WebViewController> _controller = Completer<WebViewController>();

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();


    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            CircularProgressIndicator(
              strokeWidth: 10,
              backgroundColor: Colors.pinkAccent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              value: progress.toDouble(),
            );
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.paymentUrl!));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConfig.loginScreenBackgroundGradient1,
        leading: BackButton(color: Colors.white,onPressed: (){Get.off( MainNavigation(
          navIndex: 3,
        ),);},),
        title: Text('CLICK Payment Gateway',style: TextStyle(color: Colors.white),),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
