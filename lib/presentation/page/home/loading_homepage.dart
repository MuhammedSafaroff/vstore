import 'package:flutter/material.dart';
import 'package:vstore_appl/presentation/value/statics.dart';
import '../../widgets/widget.dart';

class LoadingHomePage extends StatefulWidget {
  bool isCollapsed;
  Duration duration;
  Animation<double> scaleAnimation;
  Function menuOpen;
  TextEditingController searchField;

  LoadingHomePage({
    Key key,
    this.isCollapsed,
    this.duration,
    this.scaleAnimation,
    this.menuOpen,
  }) : super(key: key);

  @override
  _LoadingHomePageState createState() => _LoadingHomePageState();
}

class _LoadingHomePageState extends State<LoadingHomePage> {
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
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            //product items
                            return Card(
                              margin: index % 2 == 0
                                  ? EdgeInsets.only(left: 12, top: 12)
                                  : EdgeInsets.only(
                                      right: 12, left: 12, top: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    color: Colors.white30,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.all(1),
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 5, right: 20),
                                          child: Container(
                                            width: double.infinity,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 5, right: 40),
                                          child: Container(
                                            width: double.infinity,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    right: 16,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: IconButton(
                                          constraints: BoxConstraints(
                                              maxHeight: 32,
                                              maxWidth: 32,
                                              minHeight: 32,
                                              minWidth: 32),
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                            color: backgroundColor,
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: 8,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              screenWidth / 2 + screenWidth * 0.1,
                          mainAxisExtent: 220,
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
