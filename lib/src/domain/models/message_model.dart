class MessageModel {
  String status;
  String message;
  MessageModel({this.status, this.message});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MessageModel &&
      o.status == status &&
      o.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;

  @override
  String toString() => 'MessageModel(status: $status, message: $message)';
}
