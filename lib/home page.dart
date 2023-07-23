import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _screenshotController = ScreenshotController();

  void _takeScreenShot() async {
    final Uint8List? imageBytes = await _screenshotController.capture();

    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/screenshot.png';
    await File(imagePath).writeAsBytes(imageBytes!);

    final result = await ImageGallerySaver.saveImage(
      imageBytes!,
      name: 'screenshot',
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screenshot Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Screenshot(
              controller: _screenshotController,
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    'Capture this widget',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takeScreenShot,
              child: Text('Take Screenshot'),
            ),
          ],
        ),
      ),
    );
  }
}
