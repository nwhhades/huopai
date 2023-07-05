import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/furn/bindings/furn_binding.dart';
import '../modules/furn/views/furn_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotel/bindings/hotel_binding.dart';
import '../modules/hotel/views/hotel_view.dart';
import '../modules/plugin/bindings/plugin_binding.dart';
import '../modules/plugin/views/plugin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL,
      page: () => const HotelView(),
      binding: HotelBinding(),
    ),
    GetPage(
      name: _Paths.PLUGIN,
      page: () => const PluginView(),
      binding: PluginBinding(),
    ),
    GetPage(
      name: _Paths.FURN,
      page: () => const FurnView(),
      binding: FurnBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
