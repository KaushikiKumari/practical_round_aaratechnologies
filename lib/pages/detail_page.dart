import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_round_aaratechnologies/utils/colors.dart';
import 'package:practical_round_aaratechnologies/utils/strings.dart';
import 'package:practical_round_aaratechnologies/utils/strings_style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final color = Get.put(ThemeController());
  int cart_item = 0;
  void increment() {
    setState(() {
      cart_item++;
    });
  }

  void decrement() {
    setState(() {
      cart_item--;
    });
  }

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
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: SingleChildScrollView(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Stack(
              children: [
                Container(
                  height: Get.height / 3,
                  width: Get.width / 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/vegplate1.jpg"))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.keyboard_arrow_left_outlined, size: 30)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: color.backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black38),
                ),
                child: Center(
                  child: Text(Strings.PIN_NUMBER,
                      style: StringsStyle.pinnumbertextstyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(Strings.PRODUCT_NAME,
                  style: StringsStyle.productnametitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ABOUT_PRODUCT,
                  style: StringsStyle.productdetailtitlestyle),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.DESCRIBE,
                  style: StringsStyle.descriptiontitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.WHATINIT,
                  style: StringsStyle.whatinittitlestyle),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ALLERGTINFOLE,
                  style: StringsStyle.allergtinfotitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ALLERGTINFOLE_SUBTITLE,
                  style: StringsStyle.allergtinfosubtitlestyle),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            decrement();
                          },
                          icon: Icon(Icons.remove_circle_outline)),
                      Text(cart_item.toString()),
                      IconButton(
                          onPressed: () {
                            increment();
                          },
                          icon: Icon(Icons.add_circle_outline)),
                    ],
                  ),
                  Text(Strings.PRICE, style: StringsStyle.pricetitlestyle)
                ],
              ),
            )
          ]))),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: InkWell(
              onTap: () {
                ModalBottomSheet();
              },
              child: Container(
                  height: 50,
                  width: Get.width / 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text("ADD TO CART",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 15,
                          fontFamily: "Ubuntu-Regular",
                          fontWeight: FontWeight.w500,
                          color: color.backgroundColor,
                        )),
                  )),
            )),
      ),
    );
  }

  Future<dynamic> ModalBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            // height: Get.height / 1.3,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                      //  height: Get.height / 6,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        gradient: color.productcardgradientColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Strings.PRODUCT1,
                                      style: StringsStyle.product1titlestyle),
                                  SizedBox(height: 10),
                                  Text(Strings.PRICE,
                                      style:
                                          StringsStyle.productpricetitlestyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/vegplate2.png"))),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Container(
                      //  height: Get.height / 6,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        gradient: color.productcardgradientColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Strings.PRODUCT1,
                                      style: StringsStyle.product1titlestyle),
                                  SizedBox(height: 10),
                                  Text(Strings.PRICE,
                                      style:
                                          StringsStyle.productpricetitlestyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/vegplate2.png"))),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order",
                          style: TextStyle(
                              color: color.lighttextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("\$ 17.98",
                          style: TextStyle(
                              color: color.lighttextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery",
                          style: TextStyle(
                              color: color.lighttextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                      Text("\$ 2.99",
                          style: TextStyle(
                              color: color.lighttextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Summary",
                          style: TextStyle(
                              color: color.darktextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Text("\$ 20.97",
                          style: TextStyle(
                              color: color.darktextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                      height: 50,
                      width: Get.width / 1,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text("ORDER FOOD",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 15,
                              fontFamily: "Ubuntu-Regular",
                              fontWeight: FontWeight.w500,
                              color: color.backgroundColor,
                            )),
                      )),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildLandscapeContainer() {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: SingleChildScrollView(
          child: Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height / 2,
                  width: Get.width / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/vegplate1.jpg"))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.keyboard_arrow_left_outlined, size: 30)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 20, 20),
              child: Container(
                width: Get.width / 3,
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.PRICE, style: StringsStyle.pricetitlestyle),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                decrement();
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                          Text(cart_item.toString()),
                          IconButton(
                              onPressed: () {
                                increment();
                              },
                              icon: Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: color.backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black38),
                ),
                child: Center(
                  child: Text(Strings.PIN_NUMBER,
                      style: StringsStyle.pinnumbertextstyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(Strings.PRODUCT_NAME,
                  style: StringsStyle.productnametitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ABOUT_PRODUCT,
                  style: StringsStyle.productdetailtitlestyle),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.DESCRIBE,
                  style: StringsStyle.descriptiontitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: Get.width / 2,
                child: Text(
                  Strings.WHATINIT,
                  style: StringsStyle.whatinittitlestyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ALLERGTINFOLE,
                  style: StringsStyle.allergtinfotitlestyle),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(Strings.ALLERGTINFOLE_SUBTITLE,
                  style: StringsStyle.allergtinfosubtitlestyle),
            ),
          ],
        ),
      ]))),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(200, 10, 200, 10),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        // height: Get.height / 1.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: Container(
                                      //  height: Get.height / 6,
                                      width: Get.width / 2.1,
                                      decoration: BoxDecoration(
                                        gradient:
                                            color.productcardgradientColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(Strings.PRODUCT1,
                                                      style: StringsStyle
                                                          .product1titlestyle),
                                                  SizedBox(height: 10),
                                                  Text(Strings.PRICE,
                                                      style: StringsStyle
                                                          .productpricetitlestyle),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 110,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/vegplate2.png"))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 10, 0),
                                  child: Container(
                                      //  height: Get.height / 6,
                                      width: Get.width / 2.1,
                                      decoration: BoxDecoration(
                                        gradient:
                                            color.productcardgradientColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(Strings.PRODUCT1,
                                                      style: StringsStyle
                                                          .product1titlestyle),
                                                  SizedBox(height: 10),
                                                  Text(Strings.PRICE,
                                                      style: StringsStyle
                                                          .productpricetitlestyle),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 110,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/vegplate2.png"))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 20, 40, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order",
                                      style: TextStyle(
                                          color: color.lighttextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  Text("\$ 17.98",
                                      style: TextStyle(
                                          color: color.lighttextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery",
                                      style: TextStyle(
                                          color: color.lighttextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  Text("\$ 2.99",
                                      style: TextStyle(
                                          color: color.lighttextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Summary",
                                      style: TextStyle(
                                          color: color.darktextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text("\$ 20.97",
                                      style: TextStyle(
                                          color: color.darktextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Container(
                                  height: 50,
                                  width: Get.width / 1,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text("ORDER FOOD",
                                        style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontSize: 15,
                                          fontFamily: "Ubuntu-Regular",
                                          fontWeight: FontWeight.w500,
                                          color: color.backgroundColor,
                                        )),
                                  )),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text("ADD TO CART",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 15,
                          fontFamily: "Ubuntu-Regular",
                          fontWeight: FontWeight.w500,
                          color: color.backgroundColor,
                        )),
                  )),
            ),
          )),
    );
  }
}
