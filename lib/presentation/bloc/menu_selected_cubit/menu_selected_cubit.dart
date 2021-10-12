import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/page/have_a_market/have_a_market.dart';
import 'package:vstore_appl/presentation/page/home/homepage.dart';
import 'package:vstore_appl/presentation/page/markets/markets.dart';
import 'package:vstore_appl/presentation/page/profile/profile.dart';

import 'menu_selected_state.dart';


class MenuSelectedCubit extends Cubit<MenuSelectedState> {
  MenuSelectedCubit(MenuSelectedState state) : super(state);
  // var value;
  int get getNavItemIndex {
    return state.navItemIndex;
  }

  void setNavItemIndexName(int index, String name) {
    emit(MenuSelectedState(name, index));
  }

  // addValue(var v) {
  //   value = v;
  // }

  Widget? menuSelected(
      {bool? isCollapsed,
      Duration? duration,
      Animation<double>? scaleAnimation,
      Function? menuOpen,
      var value}) {
    switch (state.key) {
      case "homepage":
        return MyHomePage(
          isCollapsed: isCollapsed!,
          duration: duration!,
          scaleAnimation: scaleAnimation!,
          menuOpen: menuOpen!,
        );
      case "do_u_have_a_market":
        return HaveAMaket(
          isCollapsed: isCollapsed!,
          duration: duration!,
          scaleAnimation: scaleAnimation!,
          menuOpen: menuOpen!,
          // haveAStore: value,
        );
      case "markets":
        return Markets(
          isCollapsed: isCollapsed!,
          duration: duration!,
          scaleAnimation: scaleAnimation!,
          menuOpen: menuOpen!,
        );
      case "profile":
        return Profile(
          isCollapsed: isCollapsed!,
          duration: duration!,
          scaleAnimation: scaleAnimation!,
          menuOpen: menuOpen!,
        );
    }
  }
}
