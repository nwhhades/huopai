import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:huopai/app/routes/app_pages.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  Widget getLogo() {
    return Image.asset(
      width: 140,
      height: 40,
      "res/icons/logo.png",
      fit: BoxFit.fill,
    );
  }

  Widget createBtn(String name, String path) {
    return TextButton(
      onPressed: () {
        Get.offNamed(path);
      },
      style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.resolveWith((states) => Colors.black12)),
      child: ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 240, minWidth: 120, minHeight: 40, maxHeight: 40),
          child: Align(
            widthFactor: 1,
            heightFactor: 1,
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: "PuHuiTi",
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Wrap wrap = Wrap(
      spacing: 60.w,
      alignment: WrapAlignment.center,
      children: [
        getLogo(),
        createBtn(
          "霍派",
          Routes.HOME,
        ),
        createBtn(
          "智慧酒店",
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
    Align align = Align(
      widthFactor: 1,
      heightFactor: 1,
      alignment: Alignment.center,
      child: wrap,
    );
    Container root = Container(
        width: 1920.w, height: 120, color: Colors.white, child: align);
    return root;
  }
}
