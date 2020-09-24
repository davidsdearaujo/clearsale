class OrderModel {
  String code;
  String status;
  String score;
  
  OrderModel({
    this.code,
    this.status,
    this.score,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OrderModel &&
      o.code == code &&
      o.status == status &&
      o.score == score;
  }

  @override
  int get hashCode => code.hashCode ^ status.hashCode ^ score.hashCode;

  @override
  String toString() => 'OrderModel(code: $code, status: $status, score: $score)';
}
