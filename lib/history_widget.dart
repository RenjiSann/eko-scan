import 'package:flutter/material.dart';
import 'product_flash_card.dart';
import 'product.dart';
import 'history.dart';

class HistoryWidget extends StatefulWidget {
  final History _history;

  HistoryWidget(this._history);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget._history.products.map((e) => HistoryElement(e)).toList(),
    );
  }
}

class HistoryElement extends StatelessWidget {
  final Produit _prod;

  HistoryElement(this._prod);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: FlatButton(
            child: Row(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: _prod.picture,
                    radius: 25.0,
                  ),
                ),
                Expanded(child: Text(_prod.name)),
              ],
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FicheProduit(_prod.barcode, (Produit e) {})))));
  }
}
