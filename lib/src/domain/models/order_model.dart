

class OrderModel {
  String orderCode;
  String status;
  double score;
  
  OrderModel({
    this.orderCode,
    this.status,
    this.score,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OrderModel &&
      o.orderCode == orderCode &&
      o.status == status &&
      o.score == score;
  }

  @override
  int get hashCode => orderCode.hashCode ^ status.hashCode ^ score.hashCode;

  @override
  String toString() => 'OrderModel(code: $orderCode, status: $status, score: $score)';
}
