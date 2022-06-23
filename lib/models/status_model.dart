import 'dart:convert';

import 'package:flutter/material.dart';

class StatusModel {
  int statusId;
  String status;
  Color color;
  StatusModel({
    required this.statusId,
    required this.status,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'statusId': statusId});
    result.addAll({'status': status});
    result.addAll({'color': color.value});
  
    return result;
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      statusId: map['statusId']?.toInt() ?? 0,
      status: map['status'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) => StatusModel.fromMap(json.decode(source));
}
