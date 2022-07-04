import 'dart:convert';

import 'package:hrm_app/models/user_show.dart';

class WorkDetail {
  int workId;
  int workIdParent;
  int departmentId;
  int status;
  String dateLine;
  String workTitle;
  String workDetail;
  List<UserShow> assignUser;
  List<UserShow> reviewUser;
  WorkDetail({
    required this.workId,
    required this.workIdParent,
    required this.departmentId,
    required this.status,
    required this.dateLine,
    required this.workTitle,
    required this.workDetail,
    required this.assignUser,
    required this.reviewUser,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'workId': workId});
    result.addAll({'workIdParent': workIdParent});
    result.addAll({'departmentId': departmentId});
    result.addAll({'status': status});
    result.addAll({'dateLine': dateLine});
    result.addAll({'workTitle': workTitle});
    result.addAll({'workDetail': workDetail});
    result.addAll({'assignUser': assignUser.map((x) => x.toMap()).toList()});
    result.addAll({'reviewUser': reviewUser.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory WorkDetail.fromMap(Map<String, dynamic> map) {
    return WorkDetail(
      workId: map['workId']?.toInt() ?? 0,
      workIdParent: map['workIdParent']?.toInt() ?? 0,
      departmentId: map['departmentId']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      dateLine: map['dateLine'] ?? '',
      workTitle: map['workTitle'] ?? '',
      workDetail: map['workDetail'] ?? '',
      assignUser: map['assignUser'] == null ? [] : List<UserShow>.from(map['assignUser']?.map((x) => UserShow.fromMap(x))),
      reviewUser: map['reviewUser'] == null ? [] : List<UserShow>.from(map['reviewUser']?.map((x) => UserShow.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkDetail.fromJson(String source) => WorkDetail.fromMap(json.decode(source));
}
