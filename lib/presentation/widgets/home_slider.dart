import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({Key? key}) : super(key: key);
  List<String> images = [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
    'assets/images/slide3.png',
    'assets/images/slide4.jpg',
    'assets/images/slide5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 8,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(i),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}





// Carousel(
//         autoplay: false,
//         animationCurve: Curves.fastOutSlowIn,
//         animationDuration: Duration(milliseconds: 1200),
//         dotSize: 5.0,
//         dotIncreasedColor: backgroundColor,
//         dotBgColor: Colors.transparent,
//         dotVerticalPadding: 5.0,
//         dotSpacing: 18,
//         showIndicator: true,
//         indicatorBgPadding: 2.0,
//         boxFit: BoxFit.fill,
//         images: [
          
//         ],
//       ),