import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
            Text("Scan Result"),
            Text('$barcodeData'),
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
      final scanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Back", true, ScanMode.BARCODE);

      if (!mounted) return;

      setState(() {
        this.barcodeData = scanRes;
      });
    } on PlatformException {
      this.barcodeData = "Error";
    }
  }
}
