class ChargebackMarkingResponseModel {
  ChargebackMarkingResponseModel({
    this.orderCode,
    this.status,
  });
  final String? orderCode;
  final String? status;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChargebackMarkingResponseModel && o.orderCode == orderCode && o.status == status;
  }

  @override
  int get hashCode => orderCode.hashCode ^ status.hashCode;

  @override
  String toString() => 'ChargebackMarkingResponseModel(code: $orderCode, status: $status)';

  ChargebackMarkingResponseModel copyWith({
    String? code,
    String? status,
  }) {
    return ChargebackMarkingResponseModel(
      orderCode: code ?? this.orderCode,
      status: status ?? this.status,
    );
  }
}
