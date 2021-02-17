import 'package:eko_scan/product.dart';
import 'package:eko_scan/product_flash_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class BarcodeScan extends StatefulWidget {
  BarcodeScan({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BarcodeState();
}

class BarcodeState extends State<BarcodeScan> {
  @override
  Widget build(BuildContext context) {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            "#ff6666", "Cancel", false, ScanMode.DEFAULT)
        .listen((barecode) async {
      ProductResult result = await OpenFoodAPIClient.getProductRaw(
          "3017620422003", OpenFoodFactsLanguage.FRENCH);
      Produit newProduct = new Produit(
          result.product.productNameFR,
          result.product.brands,
          "recyclable",
          result.product.countries,
          null,
          "Bah non",
          result.product.imgSmallUrl,
          result.product.ecoscoreScore);
      if (result.status != 1) {
        return Text("Scan successful");
      }
      return Text("Scan successful");
    });
    return Text("Scan unsuccessful");
  }
}
