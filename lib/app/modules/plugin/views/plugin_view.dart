import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/plugin_controller.dart';

class PluginView extends GetView<PluginController> {
  const PluginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PluginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PluginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
