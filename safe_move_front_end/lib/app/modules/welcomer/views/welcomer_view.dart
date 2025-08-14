import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcomer_controller.dart';

class WelcomerView extends GetView<WelcomerController> {
  const WelcomerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WelcomerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WelcomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
