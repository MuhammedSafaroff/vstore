import 'package:flutter/material.dart';
import 'package:vstore_appl/presentation/widgets/home_product_item.dart';
import 'package:vstore_appl/presentation/widgets/widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraint) {
      return GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          //product items
          return HomeProductItem(
            index: index,
          );
        },
        itemCount: 8,
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
      );
    });
  }
}
