import 'package:flutter/material.dart';
import 'package:vstore_appl/presentation/widgets/widget.dart';

class PageStructure extends StatelessWidget {
  final bool? isCollapsed;
  final Duration? duration;
  final Animation<double>? scaleAnimation;
  final Function? menuOpen;
  final Widget widget;

  const PageStructure({
    Key? key,
    this.isCollapsed,
    this.duration,
    this.scaleAnimation,
    required this.widget,
    this.menuOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedPositioned(
      duration: duration!,
      top: 0,
      bottom: 0,
      left: isCollapsed! ? 0 : 0.45 * size.width,
      right: isCollapsed! ? 0 : -0.55 * size.width,
      child: ScaleTransition(
        scale: scaleAnimation!,
        child: Material(
          animationDuration: duration!,
          borderRadius: isCollapsed!
              ? BorderRadius.circular(0)
              : BorderRadius.circular(20),
          elevation: 8,
          color: Color(0xffF6F6F9),
          child: Column(
            children: [
              MyAppBar(
                isCollapsed: isCollapsed,
                menuOpen: menuOpen,
              ),
              SizedBox(height: 12),
              Flexible(child: widget),
              HomeBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
