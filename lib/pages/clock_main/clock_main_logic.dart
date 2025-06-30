import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockMainLogic extends GetxController {

  Timer? _timer;

  var second = 0.0.obs;

  var firstStr = '0'.obs;
  var secondStr = '0'.obs;
  var thirdStr = ':'.obs;
  var fourthStr = '0'.obs;
  var fifthStr = '0'.obs;
  var ymdStr = ''.obs;
  var weekStr = ''.obs;

  var bg = Colors.black.obs;
  var wordColorType = 0.obs;

  void startTimer() {
    _timer?.cancel();
    _timer = null;
    runToWord();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      runToWord();
    });
  }

  void runToWord() {
    final now = DateTime.now();
    second.value =(24 * 60 * 60 - (now.hour*60*60 + now.minute*60 + now.second)).toDouble();
    firstStr.value = DateFormat('HH').format(now).substring(0,1);
    secondStr.value = DateFormat('HH').format(now).substring(1,2);
    fourthStr.value = DateFormat('mm').format(now).substring(0,1);
    fifthStr.value = DateFormat('mm').format(now).substring(1,2);
    ymdStr.value = DateFormat('MM/dd/yyyy').format(now);
    weekStr.value = DateFormat('EEEE').format(now);
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    wordColorType.value = prefs.getInt('wordColorType') ?? 0;
    final bgStr = prefs.getString('bg') ?? '';
    bg.value = bgStr.toColor() ?? Colors.black;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    startTimer();
    super.onInit();
  }

}
