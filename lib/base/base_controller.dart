import 'package:hrm_app/models/status_model.dart';
import 'package:hrm_app/models/type_annuleave.dart';

import '../widgets/loading_wrapper.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  LoadingController get loading => Get.find<LoadingController>();

  List<StatusModel> dataStatus = <StatusModel>[
    StatusModel(statusId: 1, status: 'Chờ duyệt', color: Colors.yellow),
    StatusModel(statusId: 2, status: 'Đã duyệt', color: Colors.blueAccent),
    StatusModel(statusId: 3, status: 'Đang làm', color: Colors.blueGrey),
    StatusModel(statusId: 4, status: 'Chờ review', color: Colors.orange),
    StatusModel(statusId: 5, status: 'Đã hoàn thành', color: Colors.green),
    StatusModel(statusId: 6, status: 'Trễ', color: Colors.redAccent),
    StatusModel(statusId: 99, status: 'Đã huỷ', color: Colors.black),
  ];

  List<TypeAnnuleave> dataTypeLeave = <TypeAnnuleave>[
    TypeAnnuleave(typeId: 1, type: 'Nghỉ phép'),
    TypeAnnuleave(typeId: 2, type: 'Nghỉ ốm'),
    TypeAnnuleave(typeId: 3, type: 'Nghỉ không lương'),
    TypeAnnuleave(typeId: 4, type: 'Nghỉ chăm vợ đẻ'),
    TypeAnnuleave(typeId: 5, type: 'Nghỉ chính sách'),
    TypeAnnuleave(typeId: 6, type: 'Nghỉ làm bù'),
    TypeAnnuleave(typeId: 7, type: 'Loại khác'),
  ];

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
