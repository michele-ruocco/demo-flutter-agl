import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:hello_world/screens/player/player.dart';

class Gallery extends StatefulWidget {
  const Gallery({key});

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  var imageUrlList = [
    "https://cloud.rtl.it/channel/1000xH/rtl-1025-romeo-and-juliet-wide-rtl-play-vxhlm.jpg",
    "https://cloud.rtl.it/Song/1000x1000/gazzelle-idem-vgeb3.jpg",
    "https://cloud.rtl.it/Song/1000x1000/matteo-paolillo-icaro-origami-all-alba-matteo-and-lolloflow-wqasp.jpg",
    "https://cloud.rtl.it/Song/1000x1000/sick-luke-audi-ft-rhove-capo-plaza-tpfci.jpg",
    "https://cloud.rtl.it/Song/1000x1000/mr-rain-supereroi-wo79u.jpg",
    "https://cloud.rtl.it/Song/1000x1000/bigmama-ma-che-hit-a5lpn.jpg"
  ];

  int currentIndex = 0;

  Widget buildGallery3D() {
    return Gallery3D(
        itemCount: imageUrlList.length,
        width: MediaQuery.of(context).size.width,
        height: 300,
        isClip: true,

        // ellipseHeight: 80,
        itemConfig: const GalleryItemConfig(
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
            currentIndex = index;
          });
        },
        onClickItem: (index) => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlayerScreen();
              }))
            },
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
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.only(top: 100),
                child: buildGallery3D(),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BackgrounBlurView extends StatelessWidget {
  final String imageUrl;
  BackgrounBlurView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ))
    ]);
  }
}
