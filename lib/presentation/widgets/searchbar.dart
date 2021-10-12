import 'package:flutter/material.dart';
import 'package:vstore_appl/core/constants/statics.dart';

class HomeSearchBar extends StatelessWidget {
  final String? labelTxt;
  final bool? isCollapsed;
  final TextEditingController? textEditingController;
  const HomeSearchBar(
      {Key? key, this.labelTxt, this.isCollapsed, this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0.2, 0.2), // shadow direction: bottom right
          )
        ],
      ),
      height: 48,
      child: Theme(
        data: ThemeData(primaryColor: backgroundColor),
        child: TextField(
          enabled: isCollapsed,
          controller: textEditingController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            labelText: labelTxt,
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
