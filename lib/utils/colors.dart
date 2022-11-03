import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var productcardgradientColor = LinearGradient(
      colors: [Colors.white, Colors.white30],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  var backgroundColor = Colors.white;
  var darktextColor = Colors.black;
  var lighttextColor = Colors.black45;
  var iconColor = Colors.grey;
}
