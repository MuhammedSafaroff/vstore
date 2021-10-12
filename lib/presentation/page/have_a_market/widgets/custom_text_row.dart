import 'package:flutter/material.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow(
      {Key? key,
      @required this.title,
      this.description,
      this.isText = true,
      this.widget})
      : super(key: key);

  final title;
  final description;
  final bool isText;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.0),
          ),
          isText
              ? Text(
                  description,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 15, letterSpacing: 0.0),
                )
              : widget!,
        ],
      ),
    );
  }
}
