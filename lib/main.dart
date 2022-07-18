import 'dart:collection';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'globals.dart';

import 'games/chess.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          body: SliderDrawer(
            isDraggable: true,
            splashColor: const Color.fromARGB(0, 188, 13, 13),
            animationDuration: 500,
            appBar: SliderAppBar(
                appBarHeight: 70,
                drawerIconColor: Colors.white,
                appBarColor: Colors.black,
                title: Text(username,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700))),
            slider: Stack(
              children: [
                Container(color: Color.fromARGB(255, 0, 64, 120)),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      backgroundImage: avatar.image,
                      radius: 80,
                    ),
                    sliderItem(
                      icon: Icons.settings,
                      text: "settings",
                    ),
                    sliderItem(
                      icon: Icons.grade,
                      text: "leaderboard",
                    )
                  ],
                )
              ],
            ),
            child: Stack(alignment: Alignment.center, children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff000428),
                    Color(0xff004e92),
                  ],
                )),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        GameTile(
                            url: "",
                            image: "assets/snakeladder.jpeg",
                            text: "Snake and Ladder"),
                        SizedBox(
                          height: 20,
                        ),
                        GameTile(
                          url: "",
                          image: "assets/chess.jpeg",
                          text: "chess",
                          loc: HomePage(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GameTile(
                            url: "", image: "assets/game1.png", text: "fh4"),
                        SizedBox(
                          height: 20,
                        ),
                        GameTile(url: "", image: "assets/game1.png", text: ""),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ))
            ]),
          ),
        ));
  }
}

class sliderItem extends StatelessWidget {
  IconData icon;

  var text;
  sliderItem({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.values[2],
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      onTap: () {
        snackBar(text, "under development",ContentType.success, context);
      },
    );
  }
}

class GameTile extends StatelessWidget {
  var url, image, text, loc;

  GameTile(
      {Key? key,
      required this.url,
      required this.image,
      required this.text,
      this.loc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              color: Color(0x88000000),
              borderRadius: BorderRadius.circular(20)),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                text + "    ",
                style: TextStyle(
                  fontSize: 30,
                ),
              ))),
      onTap: () {
        snackBar("game", "under development",ContentType.success, context);
        navi(context, loc);
      },
    );
  }

  void navi(context, loc) {
    Navigator.push(
        context,
        PageTransition(
           duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    type: PageTransitionType.topToBottom,
            child: loc,
            childCurrent: this));
  }
}
