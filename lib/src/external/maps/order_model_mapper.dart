import 'package:clearsale/src/domain/models/order_model.dart';

class OrderModelMapper {
  static Map<String, dynamic> toMap(OrderModel model) {
    if (model == null) return null;
    return {
      'code': model.orderCode,
      'status': model.status,
      'score': model.score,
    };
  }

  static OrderModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    double score;
    if (map['score'] != null) {
      score = double.parse(map['score'].toString());
    }

    return OrderModel(
      orderCode: map['code'],
      status: map['status'],
      score: score,
    );
  }
}
