import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vstore_appl/core/constants/statics.dart';

class MyAppBar extends StatelessWidget {
  final bool isCollapsed;
  final Function menuOpen;
  const MyAppBar({Key key, this.isCollapsed, this.menuOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF6F6F9),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: isCollapsed
            ? BorderRadius.vertical(
                bottom: Radius.circular(20),
              )
            : BorderRadius.circular(20),
      ),
      leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: backgroundColor,
          ),
          onPressed: menuOpen),
      title: Text(
        "Vstore",
        style: TextStyle(
            color: backgroundColor, fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }
}
