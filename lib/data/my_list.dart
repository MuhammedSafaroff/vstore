import 'models/product.dart';

List<Product> productList = [
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/H3204ceffd47d4c3281987271a66b4087S/medium-women-cashmere-long-coat-real-fur-collar-100-cashmere-handmade-Real-cashmere-coat-girl-2021.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 26.91,
      oldPrice: 48.94,
      isDiscount: true),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/H1163a5fef70b4044a6b410bb3be19d4bX/New-Brief-Women-Sleeveless-Knitting-T-shirts-Slim-Fit-Female-Tees-Solid-Color-Bling-Bling-O.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 19.99,
      oldPrice: 32.00,
      isDiscount: true),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/H0b88a62bfac248629bf2d39abcbd785en/2020-Fashion-Hoodies-Women-Winter-Leisure-Polo-Collar-Womens-Pullover-kpop-Letters-Long-Sleeve-hoodie-Sweatshirts.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 0.0,
      oldPrice: 55.80,
      isDiscount: false),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/Hd92263034a284e168c4c6187b3e92d94j/2021-Spring-Fashion-Casual-High-Waist-Vertical-Wide-Leg-Black-Pant-for-Women.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 26.91,
      oldPrice: 48.94,
      isDiscount: true),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/Ha9a54581120e4c289ae012baa5472eba7/Pullovers-Women-Oversize-Ulzzang-BF-Unisex-Couples-Japanese-Striped-Knit-Sweater-Hip-Hop-Female-New-Winter.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 0.0,
      oldPrice: 48.74,
      isDiscount: false),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/H1163a5fef70b4044a6b410bb3be19d4bX/New-Brief-Women-Sleeveless-Knitting-T-shirts-Slim-Fit-Female-Tees-Solid-Color-Bling-Bling-O.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 26.91,
      oldPrice: 48.94,
      isDiscount: true),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/H0b88a62bfac248629bf2d39abcbd785en/2020-Fashion-Hoodies-Women-Winter-Leisure-Polo-Collar-Womens-Pullover-kpop-Letters-Long-Sleeve-hoodie-Sweatshirts.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 26.91,
      oldPrice: 48.94,
      isDiscount: true),
  Product(
      imageUrl:
          "https://ae01.alicdn.com/kf/Hd92263034a284e168c4c6187b3e92d94j/2021-Spring-Fashion-Casual-High-Waist-Vertical-Wide-Leg-Black-Pant-for-Women.jpg_220x220xz.jpg_.webp",
      name: "T-shirts",
      desc:
          "New Brief Women Sleeveless Knitting T-shirts Slim Fit Female Tees Solid Color Bling Bling O-Neck Women Thin Tops Fashion Classy",
      newPrice: 26.91,
      oldPrice: 48.94,
      isDiscount: true),
];

// Card(
//                               margin: index % 2 == 0
//                                   ? EdgeInsets.only(left: 12)
//                                   : EdgeInsets.only(right: 12),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     color: Colors.white30,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: double.infinity,
//                                           height: 130,
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               fit: BoxFit.contain,
//                                               image: NetworkImage(
//                                                   productList[index].imageUrl),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Text(
//                                             productList[index].name,
//                                             style: TextStyle(
//                                                 color: Colors.grey[700],
//                                                 fontSize: 16),
//                                           ),
//                                         ),
//                                         productList[index].isDiscount
//                                             ? Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceAround,
//                                                 children: [
//                                                   Text(
//                                                     "${productList[index].newPrice} AZN",
//                                                     style: TextStyle(
//                                                         color: backgroundColor,
//                                                         fontSize: isCollapsed
//                                                             ? 14
//                                                             : 10,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                   Text(
//                                                       "${productList[index].oldPrice} AZN",
//                                                       style: TextStyle(
//                                                           color:
//                                                               Colors.grey[600],
//                                                           fontSize: isCollapsed
//                                                               ? 12
//                                                               : 9,
//                                                           decoration:
//                                                               TextDecoration
//                                                                   .lineThrough)),
//                                                 ],
//                                               )
//                                             : Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 12),
//                                                 child: Text(
//                                                   "${productList[index].oldPrice} AZN",
//                                                   style: TextStyle(
//                                                       color: backgroundColor,
//                                                       fontSize:
//                                                           isCollapsed ? 14 : 10,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                         Align(
//                                           alignment: Alignment.bottomRight,
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 8.0),
//                                             child: Text(
//                                               "Baku",
//                                               style: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.w500),
//                                               textAlign: TextAlign.end,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 16,
//                                     right: 16,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.grey[100],
//                                           borderRadius:
//                                               BorderRadius.circular(16)),
//                                       child: IconButton(
//                                           constraints: BoxConstraints(
//                                               maxHeight: 32,
//                                               maxWidth: 32,
//                                               minHeight: 32,
//                                               minWidth: 32),
//                                           padding: EdgeInsets.all(0),
//                                           icon: Icon(
//                                             Icons.favorite_border,
//                                             size: 18,
//                                             color: backgroundColor,
//                                           ),
//                                           onPressed: () {}),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );

//  SliverGrid(
//                         delegate: SliverChildBuilderDelegate(
//                           (BuildContext context, int index) {
//                             return Card(
//                               margin: index % 2 == 0
//                                   ? EdgeInsets.only(left: 12)
//                                   : EdgeInsets.only(right: 12),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     color: Colors.white30,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: double.infinity,
//                                           height: 130,
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                               fit: BoxFit.contain,
//                                               image: NetworkImage(
//                                                   productList[index].imageUrl),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Text(
//                                             productList[index].name,
//                                             style: TextStyle(
//                                                 color: Colors.grey[700],
//                                                 fontSize: 16),
//                                           ),
//                                         ),
//                                         productList[index].isDiscount
//                                             ? Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceAround,
//                                                 children: [
//                                                   Text(
//                                                     "${productList[index].newPrice} AZN",
//                                                     style: TextStyle(
//                                                         color: backgroundColor,
//                                                         fontSize: isCollapsed
//                                                             ? 14
//                                                             : 10,
//                                                         fontWeight:
//                                                             FontWeight.w500),
//                                                   ),
//                                                   Text(
//                                                       "${productList[index].oldPrice} AZN",
//                                                       style: TextStyle(
//                                                           color:
//                                                               Colors.grey[600],
//                                                           fontSize: isCollapsed
//                                                               ? 12
//                                                               : 9,
//                                                           decoration:
//                                                               TextDecoration
//                                                                   .lineThrough)),
//                                                 ],
//                                               )
//                                             : Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 12),
//                                                 child: Text(
//                                                   "${productList[index].oldPrice} AZN",
//                                                   style: TextStyle(
//                                                       color: backgroundColor,
//                                                       fontSize:
//                                                           isCollapsed ? 14 : 10,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                               ),
//                                         Align(
//                                           alignment: Alignment.bottomRight,
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(
//                                                 right: 8.0),
//                                             child: Text(
//                                               "Baku",
//                                               style: TextStyle(
//                                                   color: Colors.grey[500],
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.w500),
//                                               textAlign: TextAlign.end,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Positioned(
//                                     top: 16,
//                                     right: 16,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.grey[100],
//                                           borderRadius:
//                                               BorderRadius.circular(16)),
//                                       child: IconButton(
//                                           constraints: BoxConstraints(
//                                               maxHeight: 32,
//                                               maxWidth: 32,
//                                               minHeight: 32,
//                                               minWidth: 32),
//                                           padding: EdgeInsets.all(0),
//                                           icon: Icon(
//                                             Icons.favorite_border,
//                                             size: 18,
//                                             color: backgroundColor,
//                                           ),
//                                           onPressed: () {}),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                           childCount: 8,
//                         ),
//                         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                           maxCrossAxisExtent: screenWidth / 2,
//                           mainAxisSpacing: 12.0,
//                           crossAxisSpacing: 12.0,
//                           mainAxisExtent: 220,
//                         ),
//                       )
