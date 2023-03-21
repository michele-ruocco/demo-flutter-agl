import 'package:flutter/material.dart';
import 'package:hello_world/gstreamer/gstreamer.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Video player'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: GstPlayer(
          pipeline:
              '''uridecodebin uri=http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 ! videoconvert ! video/x-raw,format=RGBA ! appsink name=sink''',
        ),
      ),
    );
  }
}
