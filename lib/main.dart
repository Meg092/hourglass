import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slider_clock/pages/clock_break/clock_break_binding.dart';
import 'package:slider_clock/pages/clock_break/clock_break_view.dart';
import 'package:slider_clock/pages/clock_main/clock_main_binding.dart';
import 'package:slider_clock/pages/clock_main/clock_main_view.dart';
import 'package:slider_clock/pages/clock_setting/clock_setting_binding.dart';
import 'package:slider_clock/pages/clock_setting/clock_setting_view.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;

List<List<Color>> bgColors = const [
  [
    Color(0xffce7e75),
    Color(0xfff3a799),
    Color(0xfff9d6cd),
    Color(0xffcca3b3),
    Color(0xfffbbe85)
  ],
  [
    Color(0xffeb6d83),
    Color(0xfffeb3b3),
    Color(0xfffddaba),
    Color(0xff8290c5),
    Color(0xffc0e0dc)
  ],
  [
    Color(0xffefc8c1),
    Color(0xff3fa887),
    Color(0xffd5d289),
    Color(0xffefa5c9),
    Color(0xfffbbe85)
  ],
];

List<GetPage<dynamic>> Body = [
  GetPage(name: '/ClockMainPage', page: () => const ClockMainPage(), binding: ClockMainBinding()),
  GetPage(name: '/ClockBreakPage', page: () => ClockBreakView(), binding: ClockBreakBinding()),
  GetPage(name: '/ClockSettingPage', page: () => ClockSettingPage(), binding: ClockSettingBinding()),
];

const String kWideFamily = 'Wide';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final wordColorType = prefs.getInt('wordColorType');
  if (wordColorType == null) {
    await prefs.setInt('wordColorType', 0);
    await prefs.setInt('wordFamily', 0);
    await prefs.setString('bg', Colors.black.toHexString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Body,
      initialRoute: '/ClockMainPage',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

