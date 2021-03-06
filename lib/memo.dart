import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Memo()));

class Memo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Memo de recyclage'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
        //elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.autorenew_rounded,
                        color: Colors.greenAccent[700],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('À recycler :',
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Text(
                        'À recycler : ',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('-carton',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 1.0)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('-bouteille en plastique',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 1.0)),
                  Text('...',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.rotate_right_rounded,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('À jeter',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('-bouteille en plastique',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blueGrey,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.brightness_1_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Le verre',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Le jeter dans les points de collecte.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Les ampoules',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Les jeter dans les points de collecte.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.battery_charging_full_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Les piles',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Les jeter dans les points de collecte.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                ])),
      ),
    );
  }
}
