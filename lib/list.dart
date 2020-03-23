import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'infos.dart';
import 'Utils/pageroutetransition.dart';
import 'form.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  double height = 100.0;

  @override
  void initState() {
    nbbadcards = 0;
    nbcards = 0;
    super.initState();
  }

  @override
  void dispose() {
    nbbadcards = 0;
    nbcards = 0;
    super.dispose();
  }

  changenbcard() {
    setState(() {
      nbbadcards++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection((ishospital == true) ? 'offres' : 'demandes')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            nbdocs = snapshot.data.documents.length;
            return Column(
              children: <Widget>[
                Container(
                  color: Color(0xFFB2C8E9),
                  height: MediaQuery.of(context).size.width / 12,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: myController,
                            onChanged: (text) {
                              if (text.length > 1)
                                setState(() {
                                  nbbadcards = 0;
                                  postalcode = text;
                                });
                            },
                            decoration: InputDecoration(
                                hintText: 'Code postal',
                                labelStyle:
                                    TextStyle(color: const Color(0xFF424242))),
                          ),
                        ),
                        Text('Listes des annonces'),
                        FlatButton(
                            onPressed: () => Navigator.push(
                                context, SlideRightRoute(page: FormScreen())),
                            child: (ishospital == true)
                                ? Text('Formuler une demande')
                                : Text('Formuler une offre'))
                      ]),
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: snapshot.data.documents
                      .map<Widget>((document) => (document['zipCode']
                                  .toString()
                                  .compareTo(postalcode) ==
                              0)
                          ? Card(
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
                                  Text('Tel: ' + document['phone']),
                                  Text('Mail: ' + document['mail']),
                                ],
                              ),
                            ))
                          : palabonne())
                      .toList(),
                ),
                Center(
                    child: (nbbadcards == nbdocs)
                        ? (ishospital == true)
                            ? Text(
                                '''Il n’y a actuellement aucune offre trouvées prés de chez vous,
si vous avez besoin d’un service et/ou d’une aide matérielle, vous pouvez formuler une demande dés maintenant.''')
                            : Text(
                                '''Il n’y a actuellement aucune demandes trouvées prés de chez vous,
si vous souhaité apporter un service et/ou une aide matérielle, vous pouvez formuler une offre dés maintenant.''')
                        : SizedBox()),
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget myappbar(BuildContext context) {
  nbcards = nbdocs - nbbadcards;
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
          Text('$nbcards offres trouvées'),
          (ishospital == true)
              ? Text('Formuler une demande')
              : Text('Formuler une offre')
        ]),
  );
}

Widget palabonne() {
  nbbadcards++;
  return SizedBox(height: 0);
}

// Center(child: (ishospital == true)?Text('''Il n’y a actuellement aucune offre trouvées prés de chez vous,
// si vous avez besoin d’un service et/ou d’une aide matérielle, vous pouvez formuler une demande dés maintenant.'''):Text('''Il n’y a actuellement aucune demandes trouvées prés de chez vous,
// si vous souhaité apporter un service et/ou une aide matérielle, vous pouvez formuler une offre dés maintenant.'''));
