import 'package:clearsale/src/domain/models/message_model.dart';

class MessageModelMapper extends MessageModel {
  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
    };
  }

  static MessageModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return MessageModel(
      message: map['message'],
      status: map['status'],
    );
  }
}
