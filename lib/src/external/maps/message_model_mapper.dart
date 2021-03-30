import 'package:clearsale/src/domain/models/message_model.dart';

class MessageModelMapper extends MessageModel {
  Map<String, dynamic> toMap() => {
        if (status != null) 'status': status,
        if (message != null) 'message': message,
      };

  static MessageModel fromMap(Map<String, dynamic> map) => MessageModel(message: map['message'], status: map['status']);
}
