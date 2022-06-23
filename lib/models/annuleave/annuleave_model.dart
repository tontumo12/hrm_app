import 'dart:convert';

class AnnuleaveModel {
  int annualLeaveId;
  int totalLeave;
  int typeLeave;
  int userId;
  int status;
  int userReview;
  String dateAnnualLeave;
  String fromTime;
  String toTime;
  String reason;
  AnnuleaveModel({
    required this.annualLeaveId,
    required this.totalLeave,
    required this.typeLeave,
    required this.userId,
    required this.status,
    required this.userReview,
    required this.dateAnnualLeave,
    required this.fromTime,
    required this.toTime,
    required this.reason,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'annualLeaveId': annualLeaveId});
    result.addAll({'totalLeave': totalLeave});
    result.addAll({'typeLeave': typeLeave});
    result.addAll({'userId': userId});
    result.addAll({'status': status});
    result.addAll({'userReview': userReview});
    result.addAll({'dateAnnualLeave': dateAnnualLeave});
    result.addAll({'fromTime': fromTime});
    result.addAll({'toTime': toTime});
    result.addAll({'reason': reason});
  
    return result;
  }

  factory AnnuleaveModel.fromMap(Map<String, dynamic> map) {
    return AnnuleaveModel(
      annualLeaveId: map['annualLeaveId']?.toInt() ?? 0,
      totalLeave: map['totalLeave']?.toInt() ?? 0,
      typeLeave: map['typeLeave']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      userReview: map['userReview']?.toInt() ?? 0,
      dateAnnualLeave: map['dateAnnualLeave'] ?? '',
      fromTime: map['fromTime'] ?? '',
      toTime: map['toTime'] ?? '',
      reason: map['reason'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnuleaveModel.fromJson(String source) => AnnuleaveModel.fromMap(json.decode(source));
}
