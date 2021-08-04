import 'package:flutter/material.dart';
import 'package:vstore_appl/constants/statics.dart';

class HomeAdType extends StatelessWidget {
  final String name;
  final EdgeInsets margin;
  const HomeAdType({Key key, this.name, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]),
          top: BorderSide(color: Colors.grey[300]),
        ),
      ),
      alignment: Alignment.center,
      width: double.infinity,
      height: 48,
      child: Text(
        name,
        style: TextStyle(
            color: backgroundColor, fontSize: 18, fontWeight: FontWeight.w900),
      ),
    );
  }
}
