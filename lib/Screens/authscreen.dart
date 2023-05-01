import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefinal/Screens/addingScreen.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../wedgets/Textfields.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController NameofTheDoc = TextEditingController();
  TextEditingController RecquiremsentofTheDoc = TextEditingController();
  TextEditingController money = TextEditingController();
  TextEditingController timetodo = TextEditingController();
  TextEditingController timetofinsh = TextEditingController();
  TextEditingController workinghours = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController locationinfo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),home: Directionality(textDirection: TextDirection.rtl,
    child:Scaffold(
          appBar: AppBar(
            title: const Text("اضف معاملة جديدة"),
          ),
          body: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: (Column(
                      children: [
                        const SizedBox(
                            height: 40.0,
                            child: Text(
                                "الرجاء ادخال كافة المعلومات المطلوبة في الحقول التالية")),
                        TextFF(
                          Controller: NameofTheDoc,
                          labletxt: "اسم المعاملة",
                        ),
                        SizedBox(height: 20.0),
                        TextFF(labletxt: "موقع المعاملة", Controller: location),
                        SizedBox(height: 20.0),
                        TextFF(labletxt: "احداثيات الموقع", Controller: locationinfo),
                        SizedBox(height: 20.0),
                        TextFF(
                            labletxt: "الاوراق المطلوبة",
                            Controller: RecquiremsentofTheDoc),
                        SizedBox(height: 20.0),
                        TextFF(labletxt: "المبلغ المطلوب", Controller: money),
                        SizedBox(height: 20.0),
                        TextFF(
                            labletxt: "الوقت المتوقع لانهاء المعاملة",
                            Controller: timetodo),
                        SizedBox(height: 20.0),
                        TextFF(
                            labletxt: "الوقت المتوقع لاستلام الوثيقة",
                            Controller: timetofinsh),
                        SizedBox(height: 20.0),
                        TextFF(
                            labletxt: "اوقات الدوام", Controller: workinghours),
                        ElevatedButton(
                            onPressed: () {
                              updatedata();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  MyApp()));
                            },
                            child: Text("ادخال"))
                      ],
                    )),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.0),
                      TextFF(labletxt: "البريد الالكتروني", Controller: email),
                      SizedBox(height: 20.0),
                      TextFF(labletxt: "كلمة المرور", Controller: password),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () {
                            signin();

                          },
                          child: Text("تسجيل الدخول")),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  AddAsVisiter()));

                          },
                          child: Text("اضافة معاملة كمستخدم"))  ],
                  );
                }
              }))),
    ));
  }

  Future signin() async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  void updatedata() {
    var RecquiremsentofTheDoc2 = json.encode(RecquiremsentofTheDoc.text);
    FirebaseFirestore.instance.collection("Users").add({
      "name": NameofTheDoc.text,
      "requirements": RecquiremsentofTheDoc2,
      "location": location.text,
      "money": money.text,
      "timetodo": timetodo.text,
      "timetofinsh": timetofinsh.text,
      "workinghours": workinghours.text,
      "locationinfo": locationinfo.text
    });
  }
}
