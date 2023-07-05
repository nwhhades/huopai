import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huopai/app/routes/app_pages.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  Widget getLogo() {
    return Image.asset(
      width: 140,
      height: 50,
      "res/icons/logo.png",
      fit: BoxFit.fill,
    );
  }

  Widget createBtn(String name, String path) {
    return TextButton(
      onPressed: () {
        Get.offNamed(path);
      },
      child: Container(height: 50, child: Text(name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Wrap root = Wrap(
      spacing: 70.w,
      runSpacing: 10.h,
      alignment: WrapAlignment.center,
      children: [
        getLogo(),
        createBtn(
          "霍派",
          Routes.HOME,
        ),
        createBtn(
          "智慧酒店解决方案",
          Routes.HOTEL,
        ),
        createBtn(
          "智能配件",
          Routes.PLUGIN,
        ),
        createBtn(
          "出口家具",
          Routes.FURN,
        ),
        createBtn(
          "加入霍派",
          Routes.ABOUT,
        ),
      ],
    );
    return Container(
        width: 1920.w,
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: root);
  }
}
