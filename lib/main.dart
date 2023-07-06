import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_floating/floating/assist/Point.dart';
import 'package:flutter_floating/floating/assist/floating_slide_type.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:huopai/app/common/ad_view.dart';
import 'package:huopai/app/common/top_bar.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void createTopBar() {
    log("添加topBar");
    var floatingOne = floatingManager.createFloating(
        "topBar",
        Floating(const TopBar(),
            slideType: FloatingSlideType.onPoint,
            point: Point<double>(0, 0),
            isShowLog: false,
            isSnapToEdge: false,
            isStartScroll: false));
    floatingOne.open(Get.overlayContext!);
  }

  void createAdView() {
    log("添加adView");
    var floatingOne = floatingManager.createFloating(
        "adView",
        Floating(const AdView(),
            slideType: FloatingSlideType.onRightAndBottom,
            isShowLog: false,
            isSnapToEdge: false,
            isStartScroll: false));
    floatingOne.open(Get.overlayContext!);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "霍派智能",
          theme: ThemeData(
              fontFamily: "PuHuiTi",
              scrollbarTheme: const ScrollbarThemeData(
                  thickness: MaterialStatePropertyAll(20),
                  radius: Radius.circular(5))),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // 默认动画效果
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),
          onInit: () {
            log("app init");
          },
          onReady: () {
            log("app ready");
            createTopBar();
            createAdView();
          },
          onDispose: () {
            log("app dispose");
          },
        );
      },
    );
  }
}
