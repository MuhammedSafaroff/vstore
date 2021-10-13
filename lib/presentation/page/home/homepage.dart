import 'package:flutter/material.dart';
import '../../widgets/widget.dart';

class MyHomePage extends StatefulWidget {
  final bool? isCollapsed;

  MyHomePage({Key? key, this.isCollapsed}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? screenWidth;
  TextEditingController? searchField;

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    screenWidth = data.size.width;

    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: [
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
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: constraint.maxWidth / 2,
                      mainAxisExtent: (constraint.maxHeight -
                              data.padding.top -
                              AppBar().preferredSize.height * 2 -
                              12) /
                          2.2,
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
                        );
                      },
                      childCount: 8,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: constraint.maxWidth / 2,
                      mainAxisExtent: (constraint.maxHeight -
                              data.padding.top -
                              AppBar().preferredSize.height * 2 -
                              12) /
                          2.2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
