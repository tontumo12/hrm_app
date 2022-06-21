import 'dart:convert';

class CommentCOntact {
  int commentWorkIdParent;
  int workId;
  int userId;
  String commentContent;
  CommentCOntact({
    required this.commentWorkIdParent,
    required this.workId,
    required this.userId,
    required this.commentContent,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'commentWorkIdParent': commentWorkIdParent});
    result.addAll({'workId': workId});
    result.addAll({'userId': userId});
    result.addAll({'commentContent': commentContent});
  
    return result;
  }

  factory CommentCOntact.fromMap(Map<String, dynamic> map) {
    return CommentCOntact(
      commentWorkIdParent: map['commentWorkIdParent']?.toInt() ?? 0,
      workId: map['workId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      commentContent: map['commentContent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentCOntact.fromJson(String source) => CommentCOntact.fromMap(json.decode(source));
}
