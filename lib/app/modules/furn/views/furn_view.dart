import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/furn_controller.dart';

class FurnView extends GetView<FurnController> {
  const FurnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FurnView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FurnView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
