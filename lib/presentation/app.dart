import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/bloc/menu_selected_cubit/menu_selected_cubit.dart';
import 'package:vstore_appl/presentation/bloc/menu_selected_cubit/menu_selected_state.dart';
import 'package:vstore_appl/core/constants/statics.dart';
import 'package:vstore_appl/presentation/page/home/menu_dashboard_layout.dart';

class App extends StatelessWidget {
  final int index;
  final String name;

  const App({Key? key, this.index = 0, this.name = 'homepage'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: backgroundColor,
          fontFamily: "VarelaRound",
          primarySwatch: backgroundMaterialColor as MaterialColor,
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