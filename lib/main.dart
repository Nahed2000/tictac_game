import 'package:flutter/material.dart';

import 'home_oage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor:  const Color.fromRGBO(0, 22, 52, 1),
          shadowColor: const Color.fromRGBO(0, 0, 255,1 ) ,
          splashColor: const Color.fromRGBO(25, 52, 94, 1.0)
      ),
      home:  const HomePage(),
    );
  }
}