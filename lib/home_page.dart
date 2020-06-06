import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solarsystem/constants.dart';
import 'package:solarsystem/data.dart';
import 'package:solarsystem/detail_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Solar System',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 24,
                        color: const Color(0x7cdbf1ff),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: Padding(
                padding: EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 48,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      activeSize: 20,
                      space: 8
                    )
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, a, b) => DetailPage(
                            planetInfo: planets[index],
                          )
                        ));
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 50,),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                elevation: 16,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 150,),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 23,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Know More',
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 25,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                            child: Hero(
                              tag: planets[index].position,
                                child: Image.asset(planets[index].iconImage)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
          color: navigationColor
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Image.asset('assets/menu_icon.png'),
              ),
              IconButton(
                icon: Image.asset('assets/search_icon.png'),
              ),
              IconButton(
                icon: Image.asset('assets/profile_icon.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
