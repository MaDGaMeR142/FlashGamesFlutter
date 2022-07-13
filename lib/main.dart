import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:io';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Games',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Game of Colors'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _high = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0x55000000),
        title: Row(children:  [
          IconButton(onPressed: (){}, icon: const Icon(Icons.person)),Spacer(),IconButton(onPressed: (){}, icon: Icon(Icons.dehaze))
        ],),
      ),
      body: Stack(children: [
        
      Container(
        height: double.infinity,
        
        decoration: BoxDecoration(
    
  ),child:ImageFiltered(imageFilter: ImageFilter.blur(sigmaY:40,sigmaX:40), //SigmaX and Y are just for X and Y directions
  child: Image.asset('assets/bg.jpg'),
  
  ),
      ),
        Column()
       
      ]),
    );
  }
}
