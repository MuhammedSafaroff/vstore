import 'package:flutter/material.dart';
import 'package:vstore_appl/presentation/widgets/home_product_item.dart';
import 'package:vstore_appl/presentation/widgets/widget.dart';

class FavoritePage extends StatelessWidget {
  final bool? isCollapsed;
  final Duration? duration;
  final Animation<double>? scaleAnimation;
  final Function? menuOpen;
  const FavoritePage(
      {Key? key,
      this.isCollapsed,
      this.duration,
      this.scaleAnimation,
      this.menuOpen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          borderRadius: isCollapsed! ? null : BorderRadius.circular(20),
          elevation: 8,
          color: Color(0xffF6F6F9),
          child: LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: [
                MyAppBar(
                  isCollapsed: isCollapsed,
                  menuOpen: menuOpen,
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      //product items
                      return HomeProductItem(
                        index: index,
                        isCollapsed: true,
                      );
                    },
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: constraint.maxWidth / 2,
                      mainAxisExtent: constraint.maxHeight / 3.1,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                  ),
                ),
                HomeBottomNavBar(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
