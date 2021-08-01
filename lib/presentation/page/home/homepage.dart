import 'package:flutter/material.dart';
import '../../widgets/widget.dart';

class MyHomePage extends StatefulWidget {
  bool isCollapsed;
  Duration duration;
  Animation<double> scaleAnimation;
  Function menuOpen;
  TextEditingController searchField;

  MyHomePage({
    Key key,
    this.isCollapsed,
    this.duration,
    this.scaleAnimation,
    this.menuOpen,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;

    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.45 * screenWidth,
      right: widget.isCollapsed ? 0 : -0.55 * screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
          borderRadius: widget.isCollapsed ? null : BorderRadius.circular(20),
          elevation: 8,
          color: Color(0xffF6F6F9),
          child: Container(
            child: Column(
              children: [
                MyAppBar(
                  isCollapsed: widget.isCollapsed,
                  menuOpen: widget.menuOpen,
                ),
                SizedBox(height: 12),
                HomeSearchBar(
                  labelTxt: "Describe Your Issue...",
                  isCollapsed: widget.isCollapsed,
                ),
                SizedBox(height: 4),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        //Slider
                        child: HomeSlider(),
                      ),
                      SliverToBoxAdapter(
                        //Elanlarin tipleri
                        child: HomeAdType(
                          name: "Vip Elanlar",
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              //product items
                              return HomeProductItem(
                                index: index,
                                isCollapsed: widget.isCollapsed,
                              );
                            },
                            childCount: 8,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: widget.isCollapsed
                                ? (screenWidth / 2)
                                : screenWidth,
                            mainAxisExtent: 240,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        //Elanlarin tipleri
                        child: HomeAdType(
                          name: "Yeni Məhsullar",
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              //product items
                              return HomeProductItem(
                                index: index,
                                isCollapsed: widget.isCollapsed,
                              );
                            },
                            childCount: 8,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: widget.isCollapsed
                                ? (screenWidth / 2)
                                : screenWidth,
                            mainAxisExtent: 240,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HomeBottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
