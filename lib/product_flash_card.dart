import 'package:flutter/material.dart';

class FicheProduit extends StatefulWidget
{
  @override
  _FicheProduitState createState() => _FicheProduitState();
}

class _FicheProduitState extends State<FicheProduit> {
  //variables of the product flash card
  String product = "Volvic citron";
  String brand = "Volvic";
  String bin = "recyclable";
  String origin = "France";
  String packaging = "plastique";
  String fairtrade = "Non issu du commerce équitable";
  String pic = "https://static.openfoodfacts.org/images/products/305/764/038/5148/front_fr.162.200.jpg";
  double score = 7.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fiche produit'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
        //elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            product = "Barilla\nspaghetti\nn°5";
            brand = "Barilla";
            origin = "Italie";
            packaging = "carton";
            bin = "recyclable";
            fairtrade = "Non issu du commerce équitable";
            score = 6.0;
            pic = "https://static.openfoodfacts.org/images/products/807/680/019/5057/front_fr.334.200.jpg";
          });
        },
        child: Icon(
          Icons.info_outline_rounded,
          color: Colors.white,
          size: 40.0,
        ),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Text(
                        '$product',
                        style: TextStyle(
                          color: Colors.blueGrey[700],
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    SizedBox(width: 90.0,),
                    CircleAvatar(
                      backgroundImage: NetworkImage(pic),
                      radius: 60.0,
                    ),
                  ]
              ),
              Divider(
                  height: 50.0,
                  color: Colors.blueGrey
              ),
              Row(
                  children: <Widget>[
                    Icon(
                      Icons.eco_outlined,
                      color : Colors.greenAccent[700],
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'EKO-SCORE : $score/10',
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          letterSpacing: 2.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.autorenew_rounded,
                    color: Colors.greenAccent[700],
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                      '$bin',
                      style: TextStyle(
                        color: Colors.greenAccent[700],
                        letterSpacing: 2.0,
                      )
                  ),
                ],
              ),
              Divider(
                  height: 50.0,
                  color: Colors.blueGrey
              ),
              Text(
                'Informations',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                  children: [
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Marque : $brand',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ]
              ),

              SizedBox(height: 15.0),
              Row(
                  children : <Widget>[
                    Icon(
                      Icons.blur_circular,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                        '$fairtrade',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            letterSpacing: 2.0
                        )
                    ),
                  ]
              ),
              SizedBox(height: 15.0,),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.flag_outlined,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                      'Origine : $origin',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          letterSpacing: 2.0
                      )
                  )
                ],
              ),
              SizedBox(height: 15.0,),
              Row(
                  children : <Widget>[
                    Icon(
                        Icons.border_all_rounded,
                        color: Colors.blueGrey
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                        'Emballage : $packaging',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            letterSpacing: 2.0
                        )
                    )
                  ]
              )
            ],
          )
      ),
    );
  }
}