import 'package:flutter/cupertino.dart';
import 'package:hrm_app/base/base_controller.dart';
import 'package:intl/intl.dart';

class CreateWorkController extends BaseController{
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDetail = TextEditingController();
  TextEditingController dateLine = TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Future<void> selectDate() async {
    final ThemeData theme = Theme.of(Get.context!);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker();
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker();
    }
  }

  Future<void> buildMaterialDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2075),
    );
    if (picked != null) {
        dateLine.text = dateFormat.format(picked);
    }
  }

  void buildCupertinoDatePicker() {
    showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(Get.context!).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime picked) {
                dateLine.text = dateFormat.format(picked);
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1950,
              maximumYear: 2075,
            ),
          );
        });
  }
}