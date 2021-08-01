import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/value/statics.dart';

import 'blocs/menu_selected_cubit/menu_selected_cubit.dart';
import 'blocs/menu_selected_cubit/menu_selected_state.dart';

import 'presentation/page/home/menu_dashboard_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final int index;
  final String name;

  const MyApp({Key key, this.index = 0, this.name = 'homepage'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: backgroundColor,
          fontFamily: "VarelaRound",
          primarySwatch: backgroundMaterialColor,
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: backgroundColor)),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MenuSelectedCubit>(
            create: (BuildContext context) =>
                MenuSelectedCubit(MenuSelectedState(name, index)),
          ),
        ],
        child: MenuDashboardLayout(),
      ),
    );
  }
}
