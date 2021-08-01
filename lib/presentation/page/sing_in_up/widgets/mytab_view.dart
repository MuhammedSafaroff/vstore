import 'package:flutter/material.dart';

import '../../../widgets/widget.dart';

class MyTabView extends StatelessWidget {
  final TabController controller;
  const MyTabView({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        SignInWidget(),
        SignUpWidget(),
      ],
    );
  }
}
