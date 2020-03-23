import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'infos.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  adddata() async {
     await Firestore.instance.collection((ishospital == true) ? 'demandes' : 'offres').document(name).setData({
      'city': city,
      'name': name,
      'text': description,
      'title': title,
      'zipCode': zipcode,
      'phone': phonenumber,
      'mail': mail,
    }).then((value) => Navigator.pop(context));
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
        child: Form(
          key: _formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Titre de l\'annonce',
                  labelStyle: TextStyle(color: const Color(0xFF424242))),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ce champ ne doit pas être vide';
                }
                return null;
              },
              onSaved: (val) => title = val,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Description',
                  labelStyle: TextStyle(color: const Color(0xFF424242))),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ce champ ne doit pas être vide';
                }
                return null;
              },
              onSaved: (val) => description = val,
            ),
            TextFormField(
            decoration: InputDecoration(
                hintText: 'Nom complet',
                labelStyle: TextStyle(color: const Color(0xFF424242))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Ce champ ne doit pas être vide';
              }
              return null;
            },
            onSaved: (val) => name = val,
            ),
            TextFormField(
            decoration: InputDecoration(
                hintText: 'Ville',
                labelStyle: TextStyle(color: const Color(0xFF424242))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Ce champ ne doit pas être vide';
              }
              return null;
            },
            onSaved: (val) => city = val,
            ),
            TextFormField(
            decoration: InputDecoration(
                hintText: 'Numero de département',
                labelStyle: TextStyle(color: const Color(0xFF424242))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Ce champ ne doit pas être vide';
              }
              return null;
            },
            onSaved: (val) => zipcode = val,
            ),
            TextFormField(
            decoration: InputDecoration(
                hintText: 'Numero de telephone',
                labelStyle: TextStyle(color: const Color(0xFF424242))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Ce champ ne doit pas être vide';
              }
              return null;
            },
            onSaved: (val) => phonenumber = val,
            ),
            TextFormField(
            decoration: InputDecoration(
                hintText: 'Adresse mail',
                labelStyle: TextStyle(color: const Color(0xFF424242))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Ce champ ne doit pas être vide';
              }
              return null;
            },
            onSaved: (val) => mail = val,
            ),
            FlatButton(onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        adddata();
                                      }
                                    }, child: Text('Envoyer'))
          ],
        )),
      ),
    ));
  }
}
