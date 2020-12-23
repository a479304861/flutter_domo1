import 'package:alipay_me/alipay_me.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';

class Alipay_meDemo extends StatefulWidget {
  @override
  _Alipay_meDemoState createState() => _Alipay_meDemoState();
}

class _Alipay_meDemoState extends State<Alipay_meDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alipay_meDemo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                // final String tid =
                //     "tid_${DateTime.now().millisecondsSinceEpoch}";
                // await AlipayMe.init(
                //     appId: "2019010362782013",
                //     pid: "2088012716890635",
                //     rsa2Private: RSAPrivate,
                //     targetId: tid);
                //
                // // 发起支付
                // await AlipayMe.pay(
                //   apyInfo,
                //   urlScheme: "alisdkdemo",
                //   // 这里的URL Schemes中输入的alisdkdemo，为测试demo，实际商户的app中要填写独立的scheme
                //   isSandbox: _isSandbox,
                // );
                //
                // //授权申请
                // await AlipayMe.auth(
                //   urlScheme: "alisdkdemo",
                //   // 这里的URL Schemes中输入的alisdkdemo，为测试demo，实际商户的app中要填写独立的scheme
                //   isSandbox: _isSandbox,
                //   authInfo: data,
                // );
              },
              child: Text("扫一扫"),
            )
          ],
        ),
      ),
    );
  }
}
