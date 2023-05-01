import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasefinal/Screens/infoscreen.dart';
import 'package:flutter/material.dart';

class Cards1 extends StatelessWidget {
  String name;
  String age;
  int id;
  Cards1({required this.name, required this.age, required this.id});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoScreen(
                        id: id,
                      )));
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album, size: 50),
                title: Text(name),
                subtitle: Text(age),
              ),
            ],
          ),
        ));
  }
}

class Card2 extends StatelessWidget {
  String title;
  String catagory;
  Icon icon;
  Stream<QuerySnapshot> info =
      FirebaseFirestore.instance.collection("users").snapshots();
  AsyncSnapshot<QuerySnapshot<Object?>> snapshot1;
  int id;
  Card2(
      {required this.id,
      required this.snapshot1,
      required this.catagory,
      required this.title,
        required this.icon
      });
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(10),elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
          title: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
            children: [icon,Text(title),
              Text(snapshot1.data!.docs[id]["$catagory"],style: TextStyle(fontSize: 20.0)),
            ],
          ),

    ));
  }
}
