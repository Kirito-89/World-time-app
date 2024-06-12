import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    // home: home(),
    initialRoute: '/',
    routes:{
      '/': (context)=>loading(),
      '/home': (context)=>home(),
      '/location':(context)=> choose_location(),
    },
  ));
}

