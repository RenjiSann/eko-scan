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
                          backgroundImage: NetworkImage(prod.pic),
                          radius: 25.0,
                        ),
                      ),
                      Expanded(child: Text(prod.product)),
                    ],
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FicheProduit("123456789", widget.callback)))));
        });
  }
}
