import 'package:flutter/material.dart';
import 'package:hello_world/gstreamer/gstreamer.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pipeHls = '-v souphttpsrc is-live=true location=http://devimages.apple.com/iphone/samples/bipbop/gear4/prog_index.m3u8 ! hlsdemux ! tsdemux ! h264parse ! avdec_h264 ! videoconvert ! autovideosink';
    
    final pipeHlsTest = 'videotestsrc ! video/x-raw,width=1280,height=720 ! videoconvert ! appsink name=sink';

    final test = 'gst-launch-1.0 souphttpsrc location=http://devimages.apple.com/iphone/samples/bipbop/gear4/prog_index.m3u8 ! hlsdemux ! decodebin ! videoconvert ! videoscale ! appsink name=sink';

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
              test,
        ),
      ),
    );
  }
}
