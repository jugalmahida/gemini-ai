import 'package:gemini/domain/entities/ai_model.dart';

class Message {
  final String userQuery;
  final AIModel resData;

  Message({
    required this.userQuery,
    required this.resData,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(userQuery: json['userQuery'], resData: json['resData']);
  }

  Map<String, dynamic> toJson() {
    return {
      "userQuery": userQuery,
      "resData": resData,
    };
  }
}
