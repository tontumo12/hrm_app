import 'dart:convert';

class Work {
  int workId;
  int workIdParent;
  int departmentId;
  int status;
  String dateLine;
  String workTitle;
  String workDetail;
  Work({
    required this.workId,
    required this.workIdParent,
    required this.departmentId,
    required this.status,
    required this.dateLine,
    required this.workTitle,
    required this.workDetail,
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
  
    return result;
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      workId: map['workId']?.toInt() ?? 0,
      workIdParent: map['workIdParent']?.toInt() ?? 0,
      departmentId: map['departmentId']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      dateLine: map['dateLine'] ?? '',
      workTitle: map['workTitle'] ?? '',
      workDetail: map['workDetail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) => Work.fromMap(json.decode(source));
}
