import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_round_aaratechnologies/pages/detail_page.dart';
import 'package:practical_round_aaratechnologies/utils/colors.dart';
import 'package:practical_round_aaratechnologies/utils/strings.dart';
import 'package:practical_round_aaratechnologies/utils/strings_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var foodName = [
    "Dunkin' Donuts",
    "Starbucks",
    "Taco Bell",
    "Pizza Hut",
    "Subway",
  ];
  var piccode = [
    "1234",
    "43256734",
    "1234566",
    "9283092",
    "8231",
  ];
  final color = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _buildLandscapeContainer();
        } else {
          return _buildPortraitContainer();
        }
      },
    );
  }

  Widget _buildPortraitContainer() {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: color.backgroundColor,
        drawer: Drawer(),
        key: _scaffoldkey,
        appBar: AppBar(
          elevation: 0.0,
          primary: true,
          iconTheme: IconThemeData(color: color.iconColor),
          backgroundColor: color.backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.notes),
            onPressed: () => _scaffoldkey.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.search, color: color.iconColor, size: 28))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(Strings.HOME_TITLE,
                    style: StringsStyle.hometitlestyle),
              ),
              Container(
                  color: color.backgroundColor,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 1.95,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 15, 5),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(DetailPage(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration:
                                              Duration(microseconds: 600));
                                    },
                                    child: Container(
                                        height: Get.height / 3.2,
                                        width: Get.width / 1,
                                        decoration: BoxDecoration(
                                          gradient:
                                              color.productcardgradientColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 20, 20, 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 25,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          piccode[index],
                                                          style: TextStyle(
                                                              color: color
                                                                  .lighttextColor,
                                                              fontFamily:
                                                                  "Ubuntu-Regular",
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)))),
                                              SizedBox(height: 20),
                                              Text(foodName[index],
                                                  style: TextStyle(
                                                      color:
                                                          color.darktextColor,
                                                      fontFamily:
                                                          "Ubuntu-Regular",
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 20, 0, 0),
                                                child: Container(
                                                  width: Get.width / 1.5,
                                                  child: Text(
                                                    Strings.ABOUT,
                                                    style: StringsStyle
                                                        .abouttitlestyle,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )))),
                            Positioned(
                              right: -50,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/vegplate2.png"))),
                              ),
                            )
                          ],
                        );
                      })),
            ],
          )),
        ));
  }

  Widget _buildLandscapeContainer() {
    final GlobalKey<ScaffoldState> _scaffoldkey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: color.backgroundColor,
        drawer: Drawer(),
        key: _scaffoldkey,
        appBar: AppBar(
          elevation: 0.0,
          primary: true,
          iconTheme: IconThemeData(color: color.iconColor),
          backgroundColor: color.backgroundColor,
          leading: IconButton(
            icon: Icon(Icons.notes),
            onPressed: () => _scaffoldkey.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.search, color: color.iconColor, size: 28))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(Strings.HOME_TITLE,
                    style: StringsStyle.hometitlestyle),
              ),
              Container(
                  color: color.backgroundColor,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 2.5,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 15, 5),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(DetailPage(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration:
                                              Duration(milliseconds: 300));
                                    },
                                    child: Container(
                                        height: Get.height / 2.5,
                                        width: Get.width / 1,
                                        decoration: BoxDecoration(
                                          gradient:
                                              color.productcardgradientColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30, 20, 20, 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 25,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          piccode[index],
                                                          style: TextStyle(
                                                              color: color
                                                                  .lighttextColor,
                                                              fontFamily:
                                                                  "Ubuntu-Regular",
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)))),
                                              SizedBox(height: 20),
                                              Text(foodName[index],
                                                  style: TextStyle(
                                                      color:
                                                          color.darktextColor,
                                                      fontFamily:
                                                          "Ubuntu-Regular",
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Container(
                                                width: 130,
                                                child: Text(
                                                  Strings.ABOUT,
                                                  style: StringsStyle
                                                      .abouttitlestyle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )))),
                            Positioned(
                              right: -30,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/vegplate2.png"))),
                              ),
                            )
                          ],
                        );
                      })),
            ],
          )),
        ));
  }
}
