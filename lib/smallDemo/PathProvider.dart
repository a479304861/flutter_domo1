import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProvider extends StatefulWidget {
  @override
  _PathProviderState createState() => _PathProviderState();
}

class _PathProviderState extends State<PathProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PathProvider"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () async {
                Directory tempDir = await getTemporaryDirectory();
                String tempPath = tempDir.path;
                print("tempPath--->$tempPath");
                Directory appDocDir = await getApplicationDocumentsDirectory();
                String appDocPath = appDocDir.path;
                print("appDocPath--->$appDocPath");
              },
            )
          ],
        ),
      ),
    );
  }
}
