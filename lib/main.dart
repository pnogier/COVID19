import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Container(
            color: Colors.white,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Face à l’épidémie du Covid-19 qui touche notre pays, les soignants, les pharmaciens, les policiers, les pompiers et tout les travailleurs qui risquent leurs santé en se battant au jour le jour contre l’épidémie et en assurant les fonctions vitales de notre pays ont plus que besoin de solidarité et de soutien, certains citoyens proposent des services et/ou des aides matérielles afin de soulager leurs quotidien.',
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      'Cette plateforme a pour but de les diffuser en mettant en place un réseaux d’entraide.',
                      textAlign: TextAlign.center)
                ],
              ),
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Container(
            color: Colors.blue,
            child: Row(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Container(
                  color: Color(0xFFB2C8E9),
                  child: mycontent('''Je suis 
un professionel de santé, de sécurité,
un travailleur qui assure les fonctions vitales
de notre pays.''', Colors.black),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Container(color: Colors.black,
                child: mycontent('''Je suis
un particulier, une entreprise,
un citoyen qui souhaite apporter son aide.''', Colors.white),),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

Widget mycontent(String text, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: color),
      ),
      Spacer(),
      Align(
        alignment: Alignment.bottomRight,
        child: Icon(Icons.arrow_forward, size: 250, color: color,),
      ),
    ],
  );
}
