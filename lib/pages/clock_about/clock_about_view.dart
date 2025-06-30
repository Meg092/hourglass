import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_about_logic.dart';

class ClockAboutPage extends GetView<ClockAboutLogic> {

  Widget _item(int index, BuildContext context) {
    final titles = ['About us'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index],style: TextStyle(color: Colors.white),),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.aboutClockUS(context);
          break;
      }
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
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context)
                  ].toColumn(),
                ).decorated(
                    color: const Color(0xff1f1f1f), borderRadius: BorderRadius.circular(12))
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).marginAll(15)),
      )
    );
  }
}
