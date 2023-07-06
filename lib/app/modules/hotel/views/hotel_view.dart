import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:huopai/app/common/assets_video.dart';

import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  const HotelView({Key? key}) : super(key: key);

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
    Column body = Column(
      children: [
        AssetsVideo(
          filePath: "res/videos/vod.mp4",
          width: 1366.w,
          height: 768.h,
        ),
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
