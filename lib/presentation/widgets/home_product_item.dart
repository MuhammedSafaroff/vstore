import 'package:flutter/material.dart';
import 'package:vstore_appl/data/my_list.dart';
import 'package:vstore_appl/presentation/value/statics.dart';

class HomeProductItem extends StatelessWidget {
  final int index;
  final bool isCollapsed;
  const HomeProductItem({Key key, this.index, this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.white30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productList[index].imageUrl),
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    productList[index].name,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ),
                productList[index].isDiscount
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${productList[index].newPrice} AZN",
                              style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text("${productList[index].oldPrice} AZN",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "${productList[index].oldPrice} AZN",
                          style: TextStyle(
                              color: backgroundColor,
                              fontSize: isCollapsed ? 14 : 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Baku",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                  constraints: BoxConstraints(
                      maxHeight: 32, maxWidth: 32, minHeight: 32, minWidth: 32),
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
  }
}
