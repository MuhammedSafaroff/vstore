import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vstore_appl/core/constants/assets.dart';

class SocialMediaPart extends StatelessWidget {
  const SocialMediaPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30),
          child: Row(
            children: [
              Text(
                "Sosial media",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.0),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.images.facebook),
              SvgPicture.asset(Assets.images.twitter),
              SvgPicture.asset(Assets.images.instagram),
              SvgPicture.asset(Assets.images.whatsapp),
            ],
          ),
        )
      ],
    );
  }
}
