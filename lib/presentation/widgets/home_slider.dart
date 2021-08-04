import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:vstore_appl/constants/statics.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: Carousel(
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1200),
        dotSize: 5.0,
        dotIncreasedColor: backgroundColor,
        dotBgColor: Colors.transparent,
        dotVerticalPadding: 5.0,
        dotSpacing: 18,
        showIndicator: true,
        indicatorBgPadding: 2.0,
        boxFit: BoxFit.fill,
        images: [
          ExactAssetImage('assets/images/slide1.png'),
          ExactAssetImage('assets/images/slide2.png'),
          ExactAssetImage('assets/images/slide3.png'),
          ExactAssetImage('assets/images/slide4.jpg'),
          ExactAssetImage('assets/images/slide5.png'),
        ],
      ),
    );
  }
}
