import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingDemo extends StatefulWidget {
  @override
  _EasyLoadingDemoState createState() => _EasyLoadingDemoState();
}

class _EasyLoadingDemoState extends State<EasyLoadingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                EasyLoading.show(status: 'loading...');
              },
              child: Text("show"),
            ),
            RaisedButton(
              onPressed: () {
                EasyLoading.showProgress(1, status: 'downloading...');
              },
              child: Text("downloading"),
            ),
            RaisedButton(
              onPressed: () {
                EasyLoading.showSuccess('Great Success!');
              },
              child: Text("Great Success"),
            ),
            RaisedButton(
              onPressed: () {
                EasyLoading.showError('Failed with Error');
              },
              child: Text("Failed with Error"),
            ),
            RaisedButton(
              onPressed: () {
                EasyLoading.showToast('Toast');
              },
              child: Text("Toast"),
            ),
            Expanded(
              child: Container(),
            ),
            RaisedButton(
              onPressed: () {
                EasyLoading.dismiss();
              },
              child: Text("dismiss"),
            ),
          ],
        ),
      ),
    );
  }
}
