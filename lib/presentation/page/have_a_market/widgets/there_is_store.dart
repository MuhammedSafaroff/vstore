import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vstore_appl/constants/statics.dart';
import 'package:vstore_appl/presentation/widgets/home_product_item.dart';

class ThereIsStore extends StatelessWidget {
  ThereIsStore({Key key, this.token}) : super(key: key);
  final String token;
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 295,
                  child: Stack(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
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
                        top: 10,
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
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 150,
                          width: screenWidth - 40,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                              left: ((screenWidth - 40) / 3) + 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    'Optimal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.phone_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      CupertinoIcons.paperplane,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: (screenWidth - 40) * 1.4 / 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '15K',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'Followers',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'Ratings',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 10,
                          bottom: 30,
                          child: Container(
                            height: 150,
                            width: (screenWidth - 40) / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://scontent-sof1-2.xx.fbcdn.net/v/t1.6435-9/126085978_1854659028007990_4937897992323261863_n.jpg?_nc_cat=106&_nc_rgb565=1&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=buZ6IdnQ1cEAX8Z6fdE&_nc_ht=scontent-sof1-2.xx&oh=d68be97c583e625942215096f5e5b6c0&oe=61220747'))),
                          ))
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tabButton(Icons.store, 'Store'),
                      tabButton(Icons.info, 'About')
                    ],
                  ),
                ),
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
                  maxCrossAxisExtent: constraints.maxWidth / 2,
                  mainAxisExtent: 240,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
              ),
            ],
          ));
    });
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

  Widget tabButton(IconData icon, String name) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: backgroundColor, size: 26),
            SizedBox(width: 4),
            Text(
              name,
              style: TextStyle(color: backgroundColor, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
