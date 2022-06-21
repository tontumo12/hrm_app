import 'dart:convert';

class ResponseLoginModels {
  final int status;
  final String message;
  final String response;
  ResponseLoginModels({
    required this.status,
    required this.message,
    required this.response,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'response': response});
  
    return result;
  }

  factory ResponseLoginModels.fromMap(Map<String, dynamic> map) {
    return ResponseLoginModels(
      status: map['status']?.toInt() ?? 0,
      message: map['message'] ?? '',
      response: map['response'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLoginModels.fromJson(String source) => ResponseLoginModels.fromMap(json.decode(source));
}
