import 'package:flutter/material.dart';
import 'product.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class FicheProduit extends StatefulWidget {
  final String _productBarcode;
  //Produit prod;
  final Function(Produit) callback;

  //FicheProduit(this.prod, this.callback);
  FicheProduit(this._productBarcode, this.callback);

  @override
  _FicheProduitState createState() => _FicheProduitState();
}

class _FicheProduitState extends State<FicheProduit> {
  //To try with the API !!!
  //Product prod = Product(product, brand, bin, origin, packaging, fairtrade, pic, score)
  bool failBarcode = false;
  Produit prod;

  Future<void> loadProduct() async {
    ProductResult result = await OpenFoodAPIClient.getProductRaw(
        widget._productBarcode, OpenFoodFactsLanguage.FRENCH);

    if (result.product != null) {
      setState(() {
        prod = Produit.fromProductResult(result);
        widget.callback(prod);
      });
    } else {
      setState(() {
        failBarcode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (prod == null) {
      if (!failBarcode) {
        loadProduct();
        return Scaffold(
            body: Center(
          child: Text(
            "Loading...",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ));
      } else {
        return Scaffold(
            body: Center(
          child: Text(
            "Unknown barcode :\n${widget._productBarcode}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ));
      }
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Product card",
              style: Theme.of(context).textTheme.headline2),
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: Theme.of(context).accentIconTheme,
        ),
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
                      child: Text('${prod.name}',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: prod.picture,
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
                        'EKO-SCORE : ${prod.score}/100',
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
                        Text('${prod.name}+10',
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
                            widget.callback(prod);
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
                        child: Text('Marque : ${prod.brand}',
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
                        child: Text('+fairtrade',
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
                          'Origine : ${prod.origin}',
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
                          child: Text('Emballage : ${prod.packaging}',
                              maxLines: 3,
                              style: Theme.of(context).textTheme.bodyText1))
                    ]),
                  ],
                ))),
      );
    }
  }
}
