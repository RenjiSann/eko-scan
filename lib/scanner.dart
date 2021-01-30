import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class BarcodeScan extends StatefulWidget
{
  BarcodeScan({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarcodeState();
}

class BarcodeState extends State<BarcodeScan>
{
  String barcodeResult;


  @override
  Widget build(BuildContext context) {
    FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", false, ScanMode.DEFAULT)
        .listen((barcode) {
      return Text("Scan successful");
    });
    return Text("Scan unsuccessful");

  }
}
