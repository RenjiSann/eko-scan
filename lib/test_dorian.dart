import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'product_flash_card.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'product.dart';

/*
/ Scanner widget 
*/
class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  // Hold the value of the scanned barcode once scanned
  String barcodeData = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Scan Result", style: Theme.of(context).textTheme.headline1),
            Text('$barcodeData', style: Theme.of(context).textTheme.bodyText1),
            RaisedButton(
              onPressed: scanBarcode,
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    try {
      int temp;
      final scanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Back", true, ScanMode.BARCODE);

      ProductResult result = await OpenFoodAPIClient.getProductRaw(
          scanRes, OpenFoodFactsLanguage.FRENCH);
      if (result.product.ecoscoreScore != null) {
        temp = result.product.ecoscoreScore.toInt();
      }
      Produit newProduct = new Produit(
          result.product.productNameFR,
          result.product.brands,
          "recyclable",
          result.product.countries,
          result.product.ingredients,
          "Bah non",
          result.product.imgSmallUrl,
          temp);
      if (result.status != 1) {
        return Text("Scan successful");
      }

      if (!mounted) return;

      setState(() {
        this.barcodeData = scanRes;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FicheProduit(newProduct)));
    } on PlatformException {
      this.barcodeData = "Error";
    }
  }
}
