import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main () {
  runApp (NbaApp());
}
class NbaApp extends StatelessWidget {
  const NbaApp({super.key});

  @override
  Widget build(BuildContext context) {   
   return MaterialApp(
     title: 'NBA app',
     home: HomePage (),
   );
  }
}








