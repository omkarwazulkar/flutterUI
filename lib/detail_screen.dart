import 'package:flutter/material.dart';
import 'package:solarsystem/data.dart';
import 'constants.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;
  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 350,
                        ),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        Divider(
                          color: Colors.black45,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          planetInfo.description ?? '',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: Colors.black45,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32.0),
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  )
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                  tag: planetInfo.position,
                  child: Image.asset(planetInfo.iconImage,
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                      colorBlendMode: BlendMode.modulate)),
            ),
            Positioned(
              top: 150,
              left: 25,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 240,
                    color: primaryTextColor.withOpacity(0.05),
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
