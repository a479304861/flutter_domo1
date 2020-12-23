import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';

class CameraPhotoDemo extends StatefulWidget {
  @override
  _CameraPhotoDemoState createState() => _CameraPhotoDemoState();
}

List<CameraDescription> cameras;

class _CameraPhotoDemoState extends State<CameraPhotoDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CameraPhotoDemo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                List<AssetEntity> assetList = await PhotoPicker.pickAsset(
                  context: context,
                  rowCount: 4,
                  maxSelected: 99,
                  checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
                    activeColor: Colors.white,
                    unselectedColor: Colors.white,
                    checkColor: Colors.blue,
                  ),
                );
                assetList.forEach((element) {
                  element.file.then((value) => print("$value"));
                });
              },
              child: Text("获得数据"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CameraPhoto();
                }));
              },
              child: Text("照相机"),
            )
          ],
        ),
      ),
    );
  }
}

class CameraPhoto extends StatefulWidget {
  @override
  _StateCameraPhoto createState() => _StateCameraPhoto();
}

class _StateCameraPhoto extends State<CameraPhoto> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: CameraPreview(controller));
  }
}
