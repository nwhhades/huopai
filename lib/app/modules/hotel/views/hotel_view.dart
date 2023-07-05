import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  const HotelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HotelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HotelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
