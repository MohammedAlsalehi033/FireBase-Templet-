import 'package:firebasefinal/Screens/authscreen.dart';
import 'package:flutter/material.dart';
class Drower extends StatelessWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: [ListTile(title: Text("add"), onTap: (){Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => AuthScreen())

    );})],),);
  }
}
