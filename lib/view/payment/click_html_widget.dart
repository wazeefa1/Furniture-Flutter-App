import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ClickHTML extends StatefulWidget {
  String htmlContent;
   ClickHTML({super.key,required this.htmlContent});

  @override
  State<ClickHTML> createState() => _ClickHTMLState();
}

class _ClickHTMLState extends State<ClickHTML> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: HtmlWidget(
        widget.htmlContent,
      )
      ,));
  }
}
