import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:slider_clock/main.dart';
import 'package:slider_clock/pages/clock_main/volume_slider.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_main_logic.dart';

class ClockMainPage extends StatefulWidget {
  const ClockMainPage({Key? key}) : super(key: key);

  @override
  State<ClockMainPage> createState() => _ClockMainPageState();
}

class _ClockMainPageState extends State<ClockMainPage> {
  final controller = Get.find<ClockMainLogic>();

  void lkalsiuid() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/ClockBreakPage');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    lkalsiuid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (_, max) {
        return Obx(() {
          return VolumeSlider(
              width: double.infinity,
              height: max.maxHeight,
              minValue: 0,
              maxValue: 24 * 60 * 60,
              initialValue: controller.second.value,
              bgColor: controller.bg.value,
              child: SafeArea(
                  child: <Widget>[
                <Widget>[
                  Image.asset(
                    'assets/icon0.webp',
                    fit: BoxFit.cover,
                  ).gestures(onTap: () {
                    Get.toNamed('/ClockSettingPage')?.then((_) {
                      controller.getData();
                    });
                  }),
                  const SizedBox(width: 10),
                ].toRow(mainAxisAlignment: MainAxisAlignment.end),
                Expanded(
                  child: <Widget>[
                    Image.asset(
                      'assets/bg.webp',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    <Widget>[
                      Obx(() {
                        return Text(
                          controller.firstStr.value,
                          style: TextStyle(
                              color: bgColors[controller.wordColorType.value][0],
                              fontSize: 218,
                              height: 0.8,
                              fontFamily: kWideFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Obx(() {
                        return Text(
                          controller.secondStr.value,
                          style: TextStyle(
                              color: bgColors[controller.wordColorType.value][1],
                              fontSize: 218,
                              height: 0.8,
                              fontFamily: kWideFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Obx(() {
                        return Text(
                          controller.thirdStr.value,
                          style: TextStyle(
                              color: bgColors[controller.wordColorType.value][2],
                              fontSize: 218,
                              height: 0.8,
                              fontFamily: kWideFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Obx(() {
                        return Text(
                          controller.fourthStr.value,
                          style: TextStyle(
                              color: bgColors[controller.wordColorType.value][3],
                              fontSize: 218,
                              height: 0.8,
                              fontFamily: kWideFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      Obx(() {
                        return Text(
                          controller.fifthStr.value,
                          style: TextStyle(
                              color: bgColors[controller.wordColorType.value][4],
                              fontSize: 218,
                              height: 0.8,
                              fontFamily: kWideFamily,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ].toRow(mainAxisAlignment: MainAxisAlignment.center)
                  ].toStack(alignment: Alignment.bottomCenter),
                ),
                const SizedBox(
                  height: 18,
                ),
                <Widget>[
                  Obx(() {
                    return Text(
                      controller.ymdStr.value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    );
                  }),
                  Obx(() {
                    return Text(
                      controller.weekStr.value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    );
                  })
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
              ]
                      .toColumn(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween)
                      .marginSymmetric(vertical: 15)));
        });
      }),
    );
  }
}
