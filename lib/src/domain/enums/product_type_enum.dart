///Lista de produto (order.product)
enum ProductTypeEnum {
  ///Outros
  others,

  ///Application
  application,

  ///Total
  total,

  ///Total Garantido
  totalGuaranteed,

  ///Score
  score,

  ///Realtime Decision
  realtimeDecision,

  ///Tickets
  tickets,
}

extension ProductTypeEnumExtension on ProductTypeEnum {
  static Map<ProductTypeEnum, int> get _values => const {
        ProductTypeEnum.others: -1,
        ProductTypeEnum.application: 1,
        ProductTypeEnum.total: 3,
        ProductTypeEnum.totalGuaranteed: 4,
        ProductTypeEnum.score: 9,
        ProductTypeEnum.realtimeDecision: 10,
        ProductTypeEnum.tickets: 11,
      };
  int toMap() => _values[this];
  static ProductTypeEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}
