import 'package:flutter/material.dart';
import 'Utils/pageroutetransition.dart';
import 'infos.dart';
import 'list.dart';

class Postalcode extends StatefulWidget {
  @override
  _PostalcodeState createState() => _PostalcodeState();
}

class _PostalcodeState extends State<Postalcode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: 'Code postal',
                labelStyle: TextStyle(color: const Color(0xFF424242))
              ),
            ),
          ),
          IconButton(icon: Icon (Icons.arrow_forward, color: Colors.black,), onPressed:() => [postalcode = myController.text, Navigator.push(context, SlideRightRoute(page: ListScreen()))],)
        ],
      ),
    ));
  }
}
