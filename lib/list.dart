import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'infos.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  double height = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        myappbar(context),
        StreamBuilder(
          stream: Firestore.instance
              .collection((ishospital == true) ? 'offres' : 'demandes')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: snapshot.data.documents
                    .map<Widget>((document) =>
                          Card(
                              child: Container(
                            child: ExpansionTile(
                              title: Text(document['title']),
                              subtitle: Text(document['name'] +
                                  ' ' +
                                  '(' +
                                  document['city'] +
                                  ')'),
                              children: <Widget>[
                                Text(document['text'] + '\n'),
                                Text('Tel: ' + document['contact']['phone']),
                                Text('Mail: ' + document['contact']['mail']),
                              ],
                            ),
                          )),
                    )
                    .toList(),
              );
            } else
              return Center(child: CircularProgressIndicator());
          },
        )
      ]),
    );
  }
}

Widget myappbar(BuildContext context) {
  return Container(
    color: Color(0xFFB2C8E9),
    height: MediaQuery.of(context).size.width / 12,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Code postal',
                  labelStyle: TextStyle(color: const Color(0xFF424242))),
            ),
          ),
          Text('nb offres trouvées'),
          (ishospital == true)
              ? Text('Formuler une demande')
              : Text('Formuler une offre')
        ]),
  );
}
