import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final int? backColor;
  final int? textColor;

  const MyCustomButton(
      {Key? key,
      this.title,
      this.onTap,
      this.backColor = 0xffFA4A0C,
      this.textColor = 0xffffffff})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap:()=> onTap!(),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color(backColor!),
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: Color(textColor!),
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
