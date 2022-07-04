import 'dart:convert';

import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/models/timekeeping/timekeeping_model.dart';
import 'package:hrm_app/pages/widgets/dialog/dialog_create_annuleave/create_annuleave_page.dart';
import 'package:hrm_app/respository/timekeeping_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeKeepingController extends BaseController{

  TimeKeepingRepository timeKeepingRepository = TimeKeepingRepository();
  RxList<TimeKeepingModel> timeKeepingModel = <TimeKeepingModel>[].obs;

  showAddChildAssetModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => CreateAnnuleavePage(),
    );
  }

  @override
  void onInit() {
    getAnnuleave();
    super.onInit();
  }

  Future<dynamic> getUsetInfo() async {
    final pref = await SharedPreferences.getInstance();
    String data = pref.getString('userInfo') ?? '';
    return jsonDecode(data);
  }

  Future<dynamic> postTimeKeeping() async {
    try{
      print('tunt');
      dynamic userInfo = await getUsetInfo();
      print('tunt');
      TimeKeepingModel body = TimeKeepingModel(
        userId: int.parse(userInfo['userid']), 
        dateTimeKeeping: '', 
        timeKeepingId: 0,
        status: 1,
      );
      print('tunt');
      final data = await timeKeepingRepository.portAnnuleve(body);
      print('tunt');
      getAnnuleave();
      return data;
    } catch(err){
      print(err);
    }
  }

  Future<void> getAnnuleave() async{
    dynamic userInfo = await getUsetInfo();
    timeKeepingModel.value = await timeKeepingRepository.getAnnuleave(int.parse(userInfo['userid']));
    timeKeepingModel.refresh();
  }

}