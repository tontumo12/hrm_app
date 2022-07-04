import 'dart:convert';

class UserShow {
  int userId;
  String userName;
  UserShow({
    required this.userId,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
  
    return result;
  }

  factory UserShow.fromMap(Map<String, dynamic> map) {
    return UserShow(
      userId: map['userId']?.toInt() ?? 0,
      userName: map['userName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserShow.fromJson(String source) => UserShow.fromMap(json.decode(source));
}
