import 'dart:convert';

import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/models/annuleave/annuleave_model.dart';
import 'package:hrm_app/models/status_model.dart';
import 'package:hrm_app/pages/widgets/dialog/dialog_create_annuleave/create_annuleave_page.dart';
import 'package:hrm_app/respository/annuleave_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnunnelController extends BaseController{
  AnnuleaveRepository annuleaveRepository = AnnuleaveRepository();

  RxList<AnnuleaveModel> data = <AnnuleaveModel>[].obs;

  @override
  void onInit() {
    getListDataWorkTodo();
    super.onInit();
  }

  Future<int> getUserId() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("userInfo");
    print(data);
    return int.parse(jsonDecode(data!)['userid']);
  }

  Future<void> getListDataWorkTodo() async {
    try{
      int userId = await getUserId();
      print(userId);
      data.value = await annuleaveRepository.getAnnuleave(userId);
      data.refresh();
    }catch(err){
      print(err);
    }
  }

  StatusModel returnStatus(int statusId) {
    return dataStatus.firstWhere((e) => e.statusId == statusId);
  }

  showAddChildAssetModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => CreateAnnuleavePage(),
    );
  }
}