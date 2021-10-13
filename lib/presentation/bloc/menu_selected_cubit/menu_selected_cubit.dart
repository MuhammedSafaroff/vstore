import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vstore_appl/presentation/page/favorite_page/favorite_page.dart';
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

  Widget? menuSelected({
    bool? isCollapsed,
  }) {
    switch (state.key) {
      case "homepage":
        return MyHomePage(
          isCollapsed: isCollapsed!,
        );
      case "do_u_have_a_market":
        return HaveAMaket();
      case "favorite":
        return FavoritePage();
      case "markets":
        return Markets();
      case "profile":
        return Profile();
    }
  }
}
