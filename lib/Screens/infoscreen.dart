import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefinal/Screens/moreinfo.dart';
import 'package:firebasefinal/main.dart';
import 'package:firebasefinal/wedgets/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  Stream<QuerySnapshot> info =
      FirebaseFirestore.instance.collection("Users").snapshots();
  int id;
  InfoScreen({required this.id});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(),home:
       Directionality(textDirection: TextDirection.rtl,
         child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder(
              stream: info,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot123) {
                if (!snapshot123.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return StreamBuilder( stream: FirebaseAuth.instance.authStateChanges(),builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Row(
                      children: [
                        Text("بيانات المعاملة"),
                        IconButton(onPressed: (){deleat(snapshot123.data!.docs[id].id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MyApp()));}, icon: Icon(Icons.delete))
                      ],
                    );
                  }
                  else {return Text("بيانات المعاملة");}
                },);
              },
            ),
          ),
          body: StreamBuilder(
            stream: info,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Expanded(child: GridView.count(clipBehavior: Clip.hardEdge,crossAxisCount: 2,children:
                  [
                    Card2(icon: Icon(Icons.credit_card),id: id, snapshot1: snapshot, catagory: "name", title: "اسم المعاملة"),
                    Card2(icon: Icon(Icons.location_on),id: id, snapshot1: snapshot, catagory: "location", title: "الموقع"),
                    Card2(icon: Icon(Icons.timer_outlined),id: id, snapshot1: snapshot, catagory: "timetodo", title: "الوقت لانجاز المعاملة"),
                    Card2(icon: Icon(Icons.timer_rounded),id: id, snapshot1: snapshot, catagory: "timetofinsh", title: "الوقت لاستلام المعاملة"),
                    Card2(icon: Icon(Icons.work_history_outlined),id: id, snapshot1: snapshot, catagory: "workinghours", title: "ساعات العمل"),
                    Card2(icon: Icon(Icons.monetization_on_outlined),id: id, snapshot1: snapshot, catagory: "money", title: "المبلغ المطلوب"),

                  ],)),ElevatedButton(onPressed: (){
                    var bytesInLatin1_decoded = json.decode(snapshot.data!.docs[id]["requirements"]);
                    print(bytesInLatin1_decoded);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MoreInfo(re: bytesInLatin1_decoded)) );}, child: Text("تفاصيل اكثر(وثائق مطلوبة وغيرها)"))],
              );
            },
          ),
      ),
       ),
    );
  }
void deleat (String docID){
    FirebaseFirestore.instance.collection("users").doc(docID).delete();
}
  static void navigateTo(String location) async {
    List<String> latandlng = location.split(',');
    double lat = double.parse(latandlng[0]);
    double lng = double.parse(latandlng[1]);
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
