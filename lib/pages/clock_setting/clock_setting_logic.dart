import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockSettingLogic extends GetxController {

  var bg = Colors.black.obs;
  var wordColorType = 0.obs;
  var wordFamily = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    wordColorType.value = prefs.getInt('wordColorType') ?? 0;
    final bgStr = prefs.getString('bg') ?? '';
    bg.value = bgStr.toColor() ?? Colors.black;
    wordFamily.value = prefs.getInt('wordFamily') ?? 0;

    super.onInit();
  }

}
