import 'package:clearsale/src/domain/models/order_model.dart';

class OrderModelMapper extends OrderModel {
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'score': score,
    };
  }

  static OrderModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    double score;
    if (map['score'] != null) {
      score = double.parse(map['score'].toString());
    }

    return OrderModel(
      code: map['code'],
      status: map['status'],
      score: score,
    );
  }
}
