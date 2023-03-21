import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:media_kit/media_kit.dart';
import 'package:video_player/screens/Player/player.dart';

class Gallery extends StatefulWidget {
  const Gallery({key});

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  var imageUrlList = [
    "https://cloud.rtl.it/channel/400xH/rtl-1025-news-wide-rtl-play-do6bu.jpg",
    "https://cloud.rtl.it/channel/400xH/rtl-1025-napula-ultra-wide-rtl-play-sfhvn.jpg",
    "http://i0.hdslb.com/bfs/manga-static/3f01609c36d4816eb227c95ac31471710fa706e6.jpg@300w.jpg",
    "http://i0.hdslb.com/bfs/manga-static/6b5ab1a7cb883504db182ee46381835e70d6d460.jpg@300w.jpg",
    "https://i0.hdslb.com/bfs/manga-static/5482454680757477d728dae82f80a280a9cc97a2.jpg@300w.jpg",
  ];

  int currentIndex = 0;

  Widget buildGallery3D() {
    return Gallery3D(
        itemCount: imageUrlList.length,
        width: MediaQuery.of(context).size.width,
        height: 300,
        isClip: true,

        // ellipseHeight: 80,
        itemConfig: GalleryItemConfig(
          width: 220,
          height: 300,
          radius: 10,
          isShowTransformMask: false,
          // shadows: [
          //   BoxShadow(
          //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
          // ]
        ),
        currentIndex: currentIndex,
        onItemChanged: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        onClickItem: (index) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayerScreen()),
            ),
        itemBuilder: (context, index) {
          return Image.network(
            imageUrlList[index],
            fit: BoxFit.cover,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              BackgrounBlurView(
                imageUrl: imageUrlList[currentIndex],
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: buildGallery3D(),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ],
          )
        ],
      ),
    );
    // return SingleChildScrollView(
    // child: Column(
    //   children: [
    //     Stack(
    //       children: [
    //         BackgrounBlurView(
    //           imageUrl: imageUrlList[currentIndex],
    //         ),
    //         Container(
    //           padding: EdgeInsets.only(top: 40),
    //           child: buildGallery3D(),
    //           margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
    //         ),
    //       ],
    //     )
    //   ],
    // ),
    // )
  }
}

class BackgrounBlurView extends StatelessWidget {
  final String imageUrl;
  BackgrounBlurView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ))
    ]);
  }
}
