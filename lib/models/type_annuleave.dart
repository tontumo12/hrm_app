import 'dart:convert';

class TypeAnnuleave {
  int typeId;
  String type;
  TypeAnnuleave({
    required this.typeId,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'typeId': typeId});
    result.addAll({'type': type});
  
    return result;
  }

  factory TypeAnnuleave.fromMap(Map<String, dynamic> map) {
    return TypeAnnuleave(
      typeId: map['typeId']?.toInt() ?? 0,
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeAnnuleave.fromJson(String source) => TypeAnnuleave.fromMap(json.decode(source));
}
