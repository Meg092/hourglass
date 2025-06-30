import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slider_clock/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_setting_logic.dart';

class ClockSettingPage extends GetView<ClockSettingLogic> {
  Widget _colorItem(int index) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(11),
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: index == controller.wordColorType.value
                    ? Colors.white
                    : Colors.transparent)),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 5),
            itemCount: 5,
            itemBuilder: (_, idx) {
              return LayoutBuilder(builder: (_, max) {
                return Container().decorated(
                    color: bgColors[index][idx],
                    borderRadius: BorderRadius.circular(10));
              });
            }),
      ).gestures(onTap: () async {
        controller.wordColorType.value = index;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('wordColorType', index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          const Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.back();
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      <Widget>[
                        <Widget>[
                          const Text(
                            'Font selection',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: controller.wordFamily.value == 0
                                          ? Colors.white
                                          : Colors.transparent)),
                              child: const Text(
                                '12:00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kWideFamily,
                                    height: 0.8,
                                    fontSize: 33),
                              ),
                            ).gestures(onTap: () async {
                              controller.wordFamily.value = 0;
                              final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setInt('wordFamily', 0);
                            });
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: controller.wordFamily.value == 1
                                          ? Colors.white
                                          : Colors.transparent)),
                              child: const Text(
                                '12:00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kWideFamily,
                                    height: 0.8,
                                    fontSize: 33),
                              ),
                            ).gestures(onTap: () async {
                              controller.wordFamily.value = 1;
                              final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setInt('wordFamily', 1);
                            });
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(() {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: controller.wordFamily.value == 2
                                          ? Colors.white
                                          : Colors.transparent)),
                              child: const Text(
                                '12:00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: kWideFamily,
                                    height: 0.8,
                                    fontSize: 33),
                              ),
                            ).gestures(onTap: () async {
                              controller.wordFamily.value = 2;
                              final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              await prefs.setInt('wordFamily', 2);
                            });
                          })
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start),
                        const SizedBox(
                          width: 100,
                        ),
                        <Widget>[
                          const Text(
                            'Color matching selection',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _colorItem(0),
                          const SizedBox(
                            height: 20,
                          ),
                          _colorItem(1),
                          const SizedBox(
                            height: 20,
                          ),
                          _colorItem(2),
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start),
                      ].toRow(

                          crossAxisAlignment: CrossAxisAlignment.start),
                      const SizedBox(height: 20,),
                      <Widget>[
                        const Text(
                          'Background color ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          return ColorPicker(
                              pickerColor: controller.bg.value,
                              colorPickerWidth: 300,
                              onColorChanged: (v) async {
                                controller.bg.value = v;
                                final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                await prefs.setString('bg', v.toHexString());
                              });
                        })
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                    .decorated(
                    color: const Color(0xff1f1f1f),
                    borderRadius: BorderRadius.circular(15))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
