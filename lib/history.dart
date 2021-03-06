import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:eko_scan/product.dart';

class History {
  // Product history
  final List<Produit> products = <Produit>[];

  // Product queue max length
  final int _limit = 100;

  // Load history from the app directory
  void loadHistory() async {
    Directory d = await getApplicationDocumentsDirectory();

    File f = File(d.path + "/history.txt");
    if (!await f.exists()) return;

    List<String> lines = await f.readAsLines();
    if (lines.length > _limit) {
      lines = lines.sublist(lines.length - _limit - 1);
    }
    for (var line in lines) {
      this.addProduct(await Produit.getFromBarcode(line));
    }
  }

  // Add a product to the history
  void addProduct(Produit prod) {
    // Abort if the product to add is the same as last one
    if (products.isNotEmpty &&
        products[products.length - 1].barcode == prod.barcode) return;

    products.insert(0, prod);
    if (products.length > _limit) products.removeAt(products.length - 1);
  }
}
