import 'package:flutter/material.dart';
import 'package:vstore_appl/core/constants/statics.dart';

class NewProductDropDown extends StatelessWidget {
  NewProductDropDown({
    Key key,
    this.items,
    this.labelText,
    this.controller,
    this.icons,
    this.validator,
  }) : super(key: key);
  final List<String> items;
  final String labelText;
  final Icon icons;
  final String Function(String) validator;
  final ValueNotifier<String> controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: controller,
      builder: (context, value, child) => DropdownButtonFormField(
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red, width: 2),
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
            labelText: labelText,
            prefixIcon: icons),
        value: value,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        validator: validator,
        // hint: Text(ddText),

        onChanged: (String newValue) => controller.value = newValue,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
