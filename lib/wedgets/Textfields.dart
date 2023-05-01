import 'package:flutter/material.dart';
class TextFF extends StatelessWidget {

  String labletxt;
  TextEditingController Controller;
  TextFF({required this.labletxt,required this.Controller});


  @override
  Widget build(BuildContext context) {
    return  TextField(maxLines: null,controller: Controller,keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:labletxt,
        ));
  }
}
