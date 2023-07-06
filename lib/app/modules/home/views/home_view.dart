import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:huopai/app/common/banner_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 120),
        child: SingleChildScrollView(
          child: Container(
            width: 1920.w,
            color: const Color(0xDDD2D2D2),
            child: Align(
              widthFactor: 1,
              heightFactor: 1,
              alignment: Alignment.topCenter,
              child: SizedBox(width: 1366.w, child: getBody()),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    List<String> imgList = [
      "res/images/home/home_banner_1.png",
      "res/images/home/home_banner_2.png",
      "res/images/home/home_banner_3.png"
    ];
    BannerView bannerView =
        BannerView(dataList: imgList, isNetData: false, width: 1366.w);
    Column body = Column(
      children: [
        bannerView,
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_1.png",
              fit: BoxFit.fill,
            )),
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_2.png",
              fit: BoxFit.fill,
            )),
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_3.png",
              fit: BoxFit.fill,
            )),
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_4.png",
              fit: BoxFit.fill,
            )),
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_5.png",
              fit: BoxFit.fill,
            )),
        SizedBox(
            width: 1366.w,
            child: Image.asset(
              "res/images/home/home_6.png",
              fit: BoxFit.fill,
            )),
      ],
    );
    return body;
  }
}
