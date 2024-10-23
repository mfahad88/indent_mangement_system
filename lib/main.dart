import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indent_mangement_system/screen/login_screen.dart';
import 'package:indent_mangement_system/utils/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var helper=DatabaseHelper.instance;
    helper.fetchData('Select * from users').then((value) {
      value.forEach((element) {
        print(element['username']);
      });
    },).onError((error, stackTrace) {
      print(error);
    },);
    
    return MaterialApp(
      title: 'Indent Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}


