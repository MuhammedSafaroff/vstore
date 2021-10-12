import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:vstore_appl/presentation/bloc/menu_selected_cubit/menu_selected_cubit.dart';

import 'package:vstore_appl/core/constants/statics.dart';

class HomeBottomNavBar extends StatelessWidget {
  int navItemIndex = 0;
  HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navItemIndex = context.read<MenuSelectedCubit>().getNavItemIndex;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home, color: backgroundColor),
                label: 'Əsas',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.thLarge, color: backgroundColor),
              label: 'Kateqoriya',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.grinHearts, color: backgroundColor),
              label: 'Favoritlər',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUserCircle,
                  color: backgroundColor),
              label: 'Kabinet',
            ),
          ],
          currentIndex: navItemIndex,
          onTap: (index) {
            var menuSelectedCubit = BlocProvider.of<MenuSelectedCubit>(context);

            switch (index) {
              case 0:
                menuSelectedCubit.setNavItemIndexName(index, 'homepage');

                break;
              case 3:
                menuSelectedCubit.setNavItemIndexName(index, 'profile');

                break;
            }
          },
          selectedItemColor: backgroundColor,
        ),
      ),
    );
  }
}
