import 'dart:convert';

import 'package:flutter/material.dart';
class MoreInfo extends StatelessWidget {
String re;
MoreInfo({required this.re});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(theme: ThemeData.dark(),home: Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(appBar: AppBar(
        title: Text("تفاصيل اكثر"),
      ),body: SingleChildScrollView(
        child: SizedBox(width: double.infinity, child: Card(
            child: Column(
              children: [
                Text(re,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20,),),
              ]
              ,
            ))),
      )),
    ),);
  }
}
