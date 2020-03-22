import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Utils/pageroutetransition.dart';
import 'postalcode.dart';
import 'infos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
  void initState() {
    ishospital = false;
    super.initState();
  }
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
de notre pays.''', Colors.black, context, true),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Container(color: Colors.black,
                child: mycontent('''Je suis
un particulier, une entreprise,
un citoyen qui souhaite apporter son aide.''', Colors.white, context, false),),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

Widget mycontent(String text, Color color, BuildContext context, bool mybool) {
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
        child: SizedBox(
          height: 250,
          width: 250,
          child: IconButton(icon: Icon (Icons.arrow_forward, size: 250, color: color), onPressed:() => [Navigator.push(context, SlideRightRoute(page: Postalcode())), ishospital = mybool],)),
      ),
    ],
  );
}
//Navigator.push(context, SlideRightRoute(page: Screen2()))