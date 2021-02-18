import 'package:eko_scan/product.dart';
import 'package:flutter/material.dart';

class Historic extends StatefulWidget {
  final List<Produit> listItems;

  Historic(this.listItems);

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
          return Card(child: Expanded(child: Text(prod.product)));
        });
  }
}
