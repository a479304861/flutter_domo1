import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';

class BarcodeScanDemo extends StatefulWidget {
  @override
  _BarcodeScanDemoState createState() => _BarcodeScanDemoState();
}

class _BarcodeScanDemoState extends State<BarcodeScanDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BarcodeScanDemo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async{
                var result = await BarcodeScanner.scan();

                print(result.type); // The result type (barcode, cancelled, failed)
                print(result.rawContent); // The barcode content
                print(result.format); // The barcode format (as enum)
                print(result.formatNote);
              },
              child: Text("扫一扫"),
            )
          ],
        ),
      ),
    );
  }
}
