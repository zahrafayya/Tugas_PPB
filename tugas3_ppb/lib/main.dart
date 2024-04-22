import 'package:flutter/material.dart';
import 'package:tugas3_ppb/pages/choose_location.dart';
import 'package:tugas3_ppb/pages/home.dart';
import 'package:tugas3_ppb/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));