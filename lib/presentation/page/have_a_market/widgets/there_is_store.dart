import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vstore_appl/data/models/store_model.dart';
import 'package:vstore_appl/presentation/value/statics.dart';
import 'package:vstore_appl/presentation/widgets/home_product_item.dart';
import 'package:vstore_appl/services/my_firebase_store.dart';

class ThereIsStore extends StatelessWidget {
  ThereIsStore({Key key, this.token}) : super(key: key);
  final String token;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://scontent-sof1-2.xx.fbcdn.net/v/t1.6435-9/126120933_1854664544674105_383906952359355596_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=e3f864&_nc_ohc=vfhPf491nOcAX8QpEEb&_nc_ht=scontent-sof1-2.xx&oh=c94cf47ecee9efb315e5c5dc43abfb41&oe=611F0211'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.black,
                          backgroundColor: Colors.grey[200],
                          padding: EdgeInsets.all(10)),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -screenWidth / 4,
                    child: Container(
                      height: screenWidth / 2 - 10,
                      width: screenWidth / 2 - 10,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffF6F6F9), width: 5),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://scontent-sof1-2.xx.fbcdn.net/v/t1.6435-9/126085978_1854659028007990_4937897992323261863_n.jpg?_nc_cat=106&_nc_rgb565=1&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=buZ6IdnQ1cEAX8Z6fdE&_nc_ht=scontent-sof1-2.xx&oh=d68be97c583e625942215096f5e5b6c0&oe=61220747'),
                        ),
                      ),
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.black,
                            backgroundColor: Colors.grey[200],
                            padding: EdgeInsets.all(10)),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: screenWidth / 4 + 10),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        labelText: 'Search',
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        primary: backgroundColor,
                        backgroundColor: backgroundColor,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.search_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      catagoryItem(Icons.electrical_services, 'Elektronika',
                          Color(0xFFA0E9F8).withOpacity(0.3)),
                      catagoryItem(Icons.computer, 'Komputer',
                          Color(0xFFcccccc).withOpacity(0.3)),
                      catagoryItem(Icons.smartphone, 'Telefon',
                          Color(0xFFcccccc).withOpacity(0.3)),
                      catagoryItem(Icons.watch, 'Saat',
                          Color(0xFFcccccc).withOpacity(0.3)),
                      catagoryItem(Icons.tv, 'Televizor',
                          Color(0xFFcccccc).withOpacity(0.3)),
                      catagoryItem(Icons.tablet_android, 'Tablet',
                          Color(0xFFcccccc).withOpacity(0.3)),
                    ],
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //product items
                  return HomeProductItem(
                    index: index,
                    isCollapsed: true,
                  );
                },
                childCount: 8,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: true ? (screenWidth / 2) : screenWidth,
                mainAxisExtent: 240,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ],
        ));
  }

  Widget catagoryItem(IconData icon, String txt, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(width: 5),
          Text(
            txt,
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
