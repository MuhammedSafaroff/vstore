import 'package:flutter/material.dart';
import 'package:vstore_appl/config/init.dart';
import 'package:vstore_appl/presentation/app.dart';


Future<void> main() async {
  await init();
  runApp(App());
}


