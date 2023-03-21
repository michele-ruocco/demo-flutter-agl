import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/screens/components/carousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildItem(String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    // ImageData(photos[index], text[index]),
                    // scroll
                    //  TopMovies()
                    Gallery()
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     // crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Continue Watching",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             fontSize: 16,
              //             color: Colors.white),
              //       ),
              //       SizedBox(
              //         width: 180,
              //       ),
              //       Text(
              //         "See All",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             fontSize: 16,
              //             color: Colors.red),
              //       )
              //     ],
              //   ),
              // ),
              // // netflixslider(),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     // crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         "Popular On Netflix",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             fontSize: 16,
              //             color: Colors.white),
              //       ),
              //       SizedBox(
              //         width: 180,
              //       ),
              //       Text(
              //         "See All",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w900,
              //             fontSize: 16,
              //             color: Colors.red),
              //       )
              //     ],
              //   ),
              // ),
              // // popularscroll
            ],
          ),
        ));
  }
}