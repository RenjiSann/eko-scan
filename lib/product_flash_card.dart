import 'package:eko_scan/scanner.dart';
import 'package:eko_scan/test_dorian.dart';
import 'package:flutter/material.dart';
import 'scanner.dart';
import 'product.dart';

class FicheProduit extends StatefulWidget {
  final Produit prod;
  final Function(Produit) callback;

  FicheProduit(this.prod, this.callback);

  @override
  _FicheProduitState createState() => _FicheProduitState();
}

class _FicheProduitState extends State<FicheProduit> {
  //To try with the API !!!
  //Product prod = Product(product, brand, bin, origin, packaging, fairtrade, pic, score)
  int nb_likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Fiche produit'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
        //elevation: 0.0,
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressed BOUTON");
        },
        child: Icon(
          Icons.info_outline_rounded,
          color: Theme.of(context).textTheme.button.color,
          size: 40.0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text('${widget.prod.product}',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.prod.pic),
                      radius: 60.0,
                    ),
                  ),
                  Divider(
                    height: 50.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  Row(children: <Widget>[
                    Icon(
                      Icons.eco_outlined,
                      color: Colors.greenAccent[700],
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'EKO-SCORE : ${widget.prod.score}/100',
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          letterSpacing: 2.0,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.autorenew_rounded,
                        color: Colors.greenAccent[700],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('${widget.prod.bin}',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.greenAccent[700],
                            letterSpacing: 2.0,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                      onPressed: () {
                        setState(() {
                          widget.callback(widget.prod);
                        });
                      },
                      shape: StadiumBorder(),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.pink[700],
                        size: 30,
                      )),
                  Divider(
                    height: 50.0,
                    color: Colors.blueGrey,
                    thickness: 1,
                  ),
                  Text(
                    'Informations',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 20.0),
                  Row(children: [
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('Marque : ${widget.prod.brand}',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1),
                    )
                  ]),
                  SizedBox(height: 15.0),
                  Row(children: <Widget>[
                    Icon(
                      Icons.blur_circular,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text('${widget.prod.fairtrade}',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodyText1),
                    )
                  ]),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.flag_outlined,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: Text(
                        'Origine : ${widget.prod.origin}',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(children: <Widget>[
                    Icon(Icons.border_all_rounded, color: Colors.blueGrey),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: Text('Emballage : ${widget.prod.packaging}',
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyText1))
                  ]),
                ],
              ))),
    );
  }
}
