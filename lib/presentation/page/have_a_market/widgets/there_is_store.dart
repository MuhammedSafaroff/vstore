import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vstore_appl/core/constants/statics.dart';
import 'package:vstore_appl/presentation/page/have_a_market/widgets/store_about.dart';
import 'package:vstore_appl/presentation/widgets/home_product_item.dart';

class ThereIsStore extends StatefulWidget {
  ThereIsStore({Key? key, this.token}) : super(key: key);
  final String? token;

  @override
  _ThereIsStoreState createState() => _ThereIsStoreState();
}

class _ThereIsStoreState extends State<ThereIsStore> {
  double? screenWidth;

  int isHome = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    screenWidth = data.size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTabController(
        length: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 315,
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
                                'https://elements-cover-images-0.imgix.net/40acf5a3-8440-4b37-8ef0-eac26b45676b?auto=compress%2Cformat&fit=max&w=710&s=fc98467ecb67c70e02e40bef81835d05'),
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
                          height: 190,
                          width: screenWidth! - 40,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                              left: ((screenWidth! - 40) / 2.9) + 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Optimal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: (screenWidth! - 40) * 1.4 / 3,
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
                                        const SizedBox(height: 10),
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
                                        const SizedBox(height: 10),
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
                              Spacer(),
                              SizedBox(
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  style: ElevatedButton.styleFrom(),
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 60,
                        child: Container(
                          height: 170,
                          width: (screenWidth! - 40) / 2.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
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
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                    child: newTabButton(Icons.store, 'Store')),
              ),
              isHome == 0
                  ? SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    )
                  : SliverToBoxAdapter(),
              isHome == 0
                  ? SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              catagoryItem(
                                  Icons.electrical_services,
                                  'Elektronika',
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
                    )
                  : SliverToBoxAdapter(),
              isHome == 0
                  ? SliverGrid(
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
                        maxCrossAxisExtent: constraints.maxWidth / 2,
                        mainAxisExtent: (constraints.maxHeight -
                                data.padding.top -
                                AppBar().preferredSize.height * 2 -
                                12) /
                            2.2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: StoreAbout(),
                    ),
            ],
          ),
        ),
      );
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

  Widget newTabButton(IconData icon, String name) {
    return Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: TabBar(
          labelColor: backgroundColor,
          labelStyle: TextStyle(fontSize: 16),
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          onTap: (index) {
            setState(() {
              isHome = index;
            });
          },
          tabs: [
            Tab(
              text: 'Store',
            ),
            Tab(
              text: 'About',
            ),
          ],
        ));
  }
}
