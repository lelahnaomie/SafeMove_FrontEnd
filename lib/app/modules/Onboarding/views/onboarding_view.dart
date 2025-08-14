import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboardingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnboardingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
