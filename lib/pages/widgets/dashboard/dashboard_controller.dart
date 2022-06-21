import 'dart:convert';

import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/models/work/work_model.dart';
import 'package:hrm_app/pages/detail_page/detail_controller.dart';
import 'package:hrm_app/respository/work_repository.dart';
import 'package:hrm_app/routers/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends BaseController{

  WorkRepository workRepository = WorkRepository();

  RxList<Work> data = <Work>[].obs;

  final DetailController storeController =
      Get.put<DetailController>(DetailController());

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
      data.value = await workRepository.getWorkAssign(userId);
      data.refresh();
    }catch(err){
      print(err);
    }
  }

  choiceDetail(int workId) {
    storeController.getListDataWorkTodo(workId);
    Get.toNamed(AppRouter.detailPage);
  }
}