import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'globals.dart';

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
    return  Scaffold(extendBodyBehindAppBar: true,
     body: SliderDrawer(
           appBar: SliderAppBar(

               appBarColor: Colors.white,
               title: Text(username,
                   style: const TextStyle(
                       fontSize: 22, fontWeight: FontWeight.w700))),
           slider: Stack(
             children: [
               Container(color: Color.fromARGB(255, 77, 22, 18)),
               Column(
                 children: [
                  SizedBox(height: 50,),
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 80,
                  ),
                   ListTile(
                    title: Row(children: [Icon(Icons.settings),Text("settings")],),
                   ),
                 ],
               )
             ],
           ),
           
           child:Stack(children: [
        
      Container(
        height: double.infinity,
        
        decoration: BoxDecoration(
    
  ),child:ImageFiltered(imageFilter: ImageFilter.blur(sigmaY:40,sigmaX:40), //SigmaX and Y are just for X and Y directions
  child: Image.asset('assets/bg.jpg'),
  
  ),
      ),
        Container(
          width: 800,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              SizedBox(height: 150,),
              Container(width: 350,
              
              height: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Color(0x88000000),
              borderRadius:BorderRadius.circular(20) ),
              )
            ],
          ),
        )
       
      ]),
         ));
  
  }
}
