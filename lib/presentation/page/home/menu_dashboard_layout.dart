import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/bloc/menu_selected_cubit/menu_selected_state.dart';

import '../../../presentation/bloc/menu_selected_cubit/menu_selected_cubit.dart';
import '../menu/menu.dart';

import '../../../core/constants/statics.dart';

class MenuDashboardLayout extends StatefulWidget {
  MenuDashboardLayout({Key? key}) : super(key: key);

  @override
  _MenuDashboardLayoutState createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;
  TextEditingController searchField = new TextEditingController();

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.68).animate(_controller!);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Menu(
                menuScaleAnimation: _menuScaleAnimation,
                slideAnimation: _slideAnimation,
                menuOpen: menuOpen),
            BlocBuilder<MenuSelectedCubit, MenuSelectedState>(
                builder: (context, state) {
              if (state is MenuSelectedState) {
                final menuSelectedCubit =
                    BlocProvider.of<MenuSelectedCubit>(context);
                return menuSelectedCubit.menuSelected(
                  isCollapsed: isCollapsed,
                  duration: duration,
                  scaleAnimation: _scaleAnimation,
                  menuOpen: menuOpen,
                )!;

              }return SizedBox.shrink();
            },),
          ],
        ),
      ),
    );
  }

  Future<void> menuOpen() async {
    if (isCollapsed) {
      FocusScope.of(context).unfocus();
      new TextEditingController().clear();
      await Future.delayed(Duration(milliseconds: 0));
      _controller!.forward();
    } else {
      await Future.delayed(Duration(milliseconds: 50));
      _controller!.reverse();
    }
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }
}
