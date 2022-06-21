import 'dart:convert';

class Comment {
  int commentWorkId;
  int commentWorkIdParent;
  int workId;
  int status;
  int userId;
  String commentContent;
  String datetimeComment;
  Comment({
    required this.commentWorkId,
    required this.commentWorkIdParent,
    required this.workId,
    required this.status,
    required this.userId,
    required this.commentContent,
    required this.datetimeComment,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'commentWorkId': commentWorkId});
    result.addAll({'commentWorkIdParent': commentWorkIdParent});
    result.addAll({'workId': workId});
    result.addAll({'status': status});
    result.addAll({'userId': userId});
    result.addAll({'commentContent': commentContent});
    result.addAll({'datetimeComment': datetimeComment});
  
    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      commentWorkId: map['commentWorkId']?.toInt() ?? 0,
      commentWorkIdParent: map['commentWorkIdParent']?.toInt() ?? 0,
      workId: map['workId']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      commentContent: map['commentContent'] ?? '',
      datetimeComment: map['datetimeComment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}
