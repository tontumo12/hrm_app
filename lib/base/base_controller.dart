import '../widgets/loading_wrapper.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  LoadingController get loading => Get.find<LoadingController>();

  @override
  void onInit() {
    super.onInit();
  }

  void onResumed() {}

  void showLoading() {
    loading.show();
  }

  void hideLoading() {
    loading.hide();
  }

  @override
  void dispose() {
    loading.hideAll();
    super.dispose();
  }
}
