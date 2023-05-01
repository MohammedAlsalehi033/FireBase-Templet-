import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../wedgets/Textfields.dart';
class AddAsVisiter extends StatefulWidget {
  @override
  State<AddAsVisiter> createState() => _AddAsVisiterState();
}

class _AddAsVisiterState extends State<AddAsVisiter> {
  TextEditingController NameofTheDoc1 = TextEditingController();

  TextEditingController RecquiremsentofTheDoc1 = TextEditingController();

  TextEditingController money1 = TextEditingController();

  TextEditingController timetodo1 = TextEditingController();

  TextEditingController timetofinsh1 = TextEditingController();

  TextEditingController workinghours1 = TextEditingController();

  TextEditingController location1 = TextEditingController();

  TextEditingController locationinfo1 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark(),home: Directionality(textDirection: TextDirection.rtl,
        child:Scaffold(
        appBar: AppBar(),body: SingleChildScrollView(
        child: (Column(
          children: [
            const SizedBox(
                height: 40.0,
                child: Text(
                    "الرجاء ادخال كافة المعلومات المطلوبة في الحقول التالية البيانات التي ستقوم باضافتها سيتم مراجعتها ثم نشرها")),
            TextFF(
              Controller: NameofTheDoc1,
              labletxt: "اسم المعاملة",
            ),
            SizedBox(height: 20.0),
            TextFF(labletxt: "موقع المعاملة", Controller: location1),
            SizedBox(height: 20.0),
            TextFF(labletxt: "احداثيات الموقع", Controller: locationinfo1),
            SizedBox(height: 20.0),
            TextFF(
                labletxt: "الاوراق المطلوبة",
                Controller: RecquiremsentofTheDoc1),
            SizedBox(height: 20.0),
            TextFF(labletxt: "المبلغ المطلوب", Controller: money1),
            SizedBox(height: 20.0),
            TextFF(
                labletxt: "الوقت المتوقع لانهاء المعاملة",
                Controller: timetodo1),
            SizedBox(height: 20.0),
            TextFF(
                labletxt: "الوقت المتوقع لاستلام الوثيقة",
                Controller: timetofinsh1),
            SizedBox(height: 20.0),
            TextFF(
                labletxt: "اوقات الدوام", Controller: workinghours1),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(behavior: SnackBarBehavior.floating,content: Text("تمت اضافة المعاملة الى طابور الانتظار سيتم مراجعة البيانات ثم نشرها")));
                  updatedata();
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyApp()));
                },
                child: Text("ادخال"))
          ],
        )),
      ),
    )));

  }

  void updatedata() {
    FirebaseFirestore.instance.collection("addasvisitor").add({
      "name": NameofTheDoc1.text,
      "requirements": RecquiremsentofTheDoc1.text,
      "location": location1.text,
      "money": money1.text,
      "timetodo": timetodo1.text,
      "timetofinsh": timetofinsh1.text,
      "workinghours": workinghours1.text,
      "locationinfo": locationinfo1.text
    });
  }
}

