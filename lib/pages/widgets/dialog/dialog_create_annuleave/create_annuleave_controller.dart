import 'package:flutter/cupertino.dart';
import 'package:hrm_app/base/base_controller.dart';
import 'package:intl/intl.dart';

class CreateAnnuleaveController extends BaseController{
  TextEditingController controllerResult = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController totalDate = TextEditingController();

  RxInt dataChoiceType = 1.obs;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  void choiceDataChoiceType(value){
    dataChoiceType.value = value;
  }

  Future<void> selectDate({
    required int type, //type = 1: date of birth, type = 2: date card
  }) async {
    final ThemeData theme = Theme.of(Get.context!);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(type);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(type);
    }
  }

  Future<void> buildMaterialDatePicker(int type) async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2075),
    );
    if (picked != null) {
      if(type == 1) {
        toDate.text = dateFormat.format(picked);
      }else{
        fromDate.text = dateFormat.format(picked);
      }
    }
  }

  void buildCupertinoDatePicker(int type) {
    showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(Get.context!).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime picked) {
                if(type == 1) {
                  toDate.text = dateFormat.format(picked);
                }else{
                  fromDate.text = dateFormat.format(picked);
                }
              },
              initialDateTime: DateTime.now(),
              minimumYear: 1950,
              maximumYear: 2075,
            ),
          );
        });
  }

}