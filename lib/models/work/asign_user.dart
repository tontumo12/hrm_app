import 'dart:convert';

class AsignUser {
  int userId;
  int workId;
  AsignUser({
    required this.userId,
    required this.workId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'workId': workId});
  
    return result;
  }

  factory AsignUser.fromMap(Map<String, dynamic> map) {
    return AsignUser(
      userId: map['userId']?.toInt() ?? 0,
      workId: map['workId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AsignUser.fromJson(String source) => AsignUser.fromMap(json.decode(source));
}
