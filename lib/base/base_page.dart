import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseScreen<T extends GetxController> extends StatelessWidget
    with RouteAware {
  BaseScreen({T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String get getTag => tag ?? '';

  void setController({T? screenController, bool isKeep = false}) {
    T? _tempC;
    if (screenController != null) {
      _tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      _tempC = putController();
    }

    if (_tempC != null) {
      controller = GetInstance().put<T>(_tempC, permanent: isKeep, tag: getTag);
    } else {
      controller = GetInstance().find<T>(tag: getTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {}
}

abstract class BaseScreenStateful<SF extends StatefulWidget,
    T extends GetxController> extends State<SF>{
  BaseScreenStateful({T? screenController, this.tag, bool isKeep = false}) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  final String? tag;
  late final T controller;

  T? putController();

  void setController({T? screenController, bool isKeep = false}) {
    T? _tempC;
    if (screenController != null) {
      _tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: tag)) {
      _tempC = putController();
    }

    if (_tempC != null) {
      controller = GetInstance().put<T>(_tempC, permanent: isKeep, tag: tag);
    } else {
      controller = GetInstance().find<T>(tag: tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();

  @override
  void dispose() {
    super.dispose();
  }
}
