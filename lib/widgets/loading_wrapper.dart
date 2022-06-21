import 'package:hrm_app/base/base_page.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

class LoadingWrapper extends BaseScreen<LoadingController> {
  LoadingWrapper({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget builder() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          child ?? const SizedBox(),
          Obx(() => Visibility(
                visible: controller.loadingCtrl.value,
                child: ColoredBox(
                  color: Colors.grey.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF050B5B),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  @override
  LoadingController? putController() {
    return LoadingController();
  }

  @override
  String? screenName() => null;
}

class LoadingController extends GetxController {
  Rx<bool> loadingCtrl = Rx<bool>(false);
  int _count = 0;

  void show() {
    _count += 1;

    if (_count == 1) {
      loadingCtrl.value = true;
    }
  }

  void hide() {
    _count -= 1;

    if (_count == 0) {
      loadingCtrl.value = false;
    }
  }

  void hideAll() {
    _count = 0;

    loadingCtrl.value = false;
  }
}
