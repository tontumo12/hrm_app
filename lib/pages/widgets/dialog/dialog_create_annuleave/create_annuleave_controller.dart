import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/models/annuleave/annuleave_model.dart';
import 'package:hrm_app/pages/detail_page/detail_controller.dart';
import 'package:hrm_app/pages/widgets/anunnel/anunnel_controller.dart';
import 'package:hrm_app/respository/annuleave_repository.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAnnuleaveController extends BaseController{
  TextEditingController controllerResult = TextEditingController();
  TextEditingController toDate = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController totalDate = TextEditingController();

  RxInt dataChoiceType = 1.obs;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  AnnuleaveRepository annuleaveRepository = AnnuleaveRepository();

  final AnunnelController storeController =
    Get.put<AnunnelController>(AnunnelController());

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

  Future<dynamic> getUsetInfo() async {
    final pref = await SharedPreferences.getInstance();
    String data = pref.getString('userInfo') ?? '';
    return jsonDecode(data);
  }

  Future<dynamic> postAnnuleave() async {
    try{
      print('tunt');
      dynamic userInfo = await getUsetInfo();
      print('tunt');
      AnnuleaveModel body = AnnuleaveModel(
        annualLeaveId: 0, 
        dateAnnualLeave: '', 
        fromTime: fromDate.text, 
        reason: '', 
        status: 1, 
        totalLeave: int.parse(totalDate.text), 
        toTime: toDate.text, 
        typeLeave: dataChoiceType.value, 
        userId: int.parse(userInfo['userid']), 
        userReview: 1,
      );
      print('tunt');
      final data =  await annuleaveRepository.portAnnuleve(body);
      print('tunt');
      storeController.getListDataWorkTodo();
      return data;
    } catch(err){
      print(err);
    }
  }

}