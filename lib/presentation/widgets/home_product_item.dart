import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vstore_appl/data/my_list.dart';
import 'package:vstore_appl/constants/statics.dart';

class HomeProductItem extends StatelessWidget {
  HomeProductItem({Key key, this.index, this.isCollapsed}) : super(key: key);
  final int index;
  final bool isCollapsed;
  final ValueNotifier<bool> favorite = ValueNotifier<bool>(false);

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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(
                    productList[index].customer,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
                  child: Text(
                    productList[index].name,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ),
                Spacer(),
                productList[index].isDiscount
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${productList[index].newPrice} AZN",
                              style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 4),
                            Text("${productList[index].oldPrice} AZN",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 10),
                        child: Text(
                          "${productList[index].oldPrice} AZN",
                          style: TextStyle(
                              color: backgroundColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            top: 14,
            right: 14,
            child: ValueListenableBuilder<bool>(
              valueListenable: favorite,
              builder: (context, value,c) {
                return InkWell(
                  child: Icon(
                   value?Icons.favorite: Icons.favorite_border,
                    size: 28,
                    color: backgroundColor,
                  ),
                  onTap: () {
                    favorite.value=!favorite.value;
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
