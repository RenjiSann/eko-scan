import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'product_flash_card.dart';
import 'product.dart';

/*
/ Scanner widget 
*/
class Scanner extends StatefulWidget {
  final Function(Produit) callback;

  Scanner(this.callback);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  // Hold the value of the scanned barcode once scanned
  String barcodeData = "None";

  // To avoid pressing the button twice and crash
  bool scanEnabled = true;

  // TODO : Make this beautifuL
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Scan Result", style: Theme.of(context).textTheme.headline1),
            Text('$barcodeData', style: Theme.of(context).textTheme.bodyText1),
            RaisedButton(
              onPressed: () {
                if (!scanEnabled) return;
                scanEnabled = false;
                scanBarcode();
              },
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
      final scanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Back", true, ScanMode.BARCODE);

      if (!mounted) return;

      setState(() {
        this.barcodeData = scanRes;
        scanEnabled = true;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FicheProduit(scanRes, widget.callback)));
    } on PlatformException {
      this.barcodeData = "Error";
    }
  }
}
