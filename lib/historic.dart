import 'package:eko_scan/product.dart';
import 'package:flutter/material.dart';
import 'product_flash_card.dart';

class Historic extends StatefulWidget {
  final List<Produit> listItems;
  final Function(Produit) callback;

  Historic(this.listItems, this.callback);

  @override
  _HistoricState createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.widget.listItems.length,
        itemBuilder: (context, index) {
          var prod = this.widget.listItems[index];
          return Card(
              child: FlatButton(
                  child: Row(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: prod.picture,
                          radius: 25.0,
                        ),
                      ),
                      Expanded(child: Text(prod.name)),
                    ],
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FicheProduit(prod.barcode, widget.callback)))));
        });
  }
}

class History {
  // Product history
  List<Produit> _products;

  // Product queue max length
  final int _limit = 100;

  void addProduct(Produit prod) {
    if (_products.isNotEmpty &&
        _products[_products.length - 1].barcode == prod.barcode) return;

    _products.add(prod);
    if (_products.length > _limit) _products.removeAt(0);
  }
}
