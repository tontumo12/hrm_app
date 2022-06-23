import 'dart:convert';

class TimeKeepingModel {
  int timeKeepingId;
  int userId;
  int status;
  String dateTimeKeeping;
  TimeKeepingModel({
    required this.timeKeepingId,
    required this.userId,
    required this.status,
    required this.dateTimeKeeping,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'timeKeepingId': timeKeepingId});
    result.addAll({'userId': userId});
    result.addAll({'status': status});
    result.addAll({'dateTimeKeeping': dateTimeKeeping});
  
    return result;
  }

  factory TimeKeepingModel.fromMap(Map<String, dynamic> map) {
    return TimeKeepingModel(
      timeKeepingId: map['timeKeepingId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      dateTimeKeeping: map['dateTimeKeeping'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeKeepingModel.fromJson(String source) => TimeKeepingModel.fromMap(json.decode(source));
}
