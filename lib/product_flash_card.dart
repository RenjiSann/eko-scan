import 'package:eko_scan/test_dorian.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'themes.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class FicheProduit extends StatefulWidget {
  final String _product_barcode;
  //Produit prod;
  final Function(Produit) callback;

  //FicheProduit(this.prod, this.callback);
  FicheProduit(this._product_barcode, this.callback);

  @override
  _FicheProduitState createState() => _FicheProduitState();
}

class _FicheProduitState extends State<FicheProduit> {
  //To try with the API !!!
  //Product prod = Product(product, brand, bin, origin, packaging, fairtrade, pic, score)
  bool fail_barcode = false;
  Produit prod;

  Future<void> loadProduct() async {
    ProductResult result = await OpenFoodAPIClient.getProductRaw(
        widget._product_barcode, OpenFoodFactsLanguage.FRENCH);

    if (result != null) {
      setState(() {
        prod = new Produit(
            result.product.productNameFR,
            result.product.brands,
            "recyclable",
            result.product.countries,
            result.product.ingredients,
            "Bah non",
            result.product.imgSmallUrl,
            5);
        widget.callback(prod);
      });
    } else {
      setState(() {
        fail_barcode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (prod == null) {
      if (!fail_barcode) {
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
            "Unknown barcode :\n${widget._product_barcode}",
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
                      child: Text('${prod.product}',
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(prod.pic),
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
                        color: EkoScanThemes.ekoGreen,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'EKO-SCORE : ${prod.score}/100',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.headline3
                      ),
                    ]),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.autorenew_rounded,
                          color: EkoScanThemes.ekoGreen,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('${prod.bin}',
                            maxLines: 3,
                            style: Theme.of(context).textTheme.bodyText2
                            ),
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
                        child: Text('${prod.fairtrade}',
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
