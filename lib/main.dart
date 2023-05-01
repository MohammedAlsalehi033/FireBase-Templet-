import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefinal/wedgets/cards.dart';
import 'package:firebasefinal/wedgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      home:Directionality(textDirection: TextDirection.rtl,
        child: AddData(),
    )) ;
  }
}

class AddData extends StatelessWidget {
  Stream <QuerySnapshot> users = FirebaseFirestore.instance.collection("Users").snapshots();
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.dark(),home: Scaffold(drawer: Drower(),
        appBar: AppBar(
          title: Text("معاملات"),
        ),
        body:  StreamBuilder(
              stream: users,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child:   CircularProgressIndicator(),
                  );
                }

                else{
                  return ListView.builder(itemCount: snapshot.data!.size,itemBuilder: (context,i){
                    return Cards1(id: i,name: snapshot.data!.docs[i]["name"], age: snapshot.data!.docs[i]["location"]);
                  });
                }},
            )),
    );
        }




  }



