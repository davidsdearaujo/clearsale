///Lista de Status (de entrada)
///
///Atenção: Ao enviar o status no pedido é importante ressaltar que este pedido será incluso como histórico e não será analisado pela ClearSale.
enum RequestStatusEnum {
  ///Novo (será analisado pelo ClearSale)
  newToAnalisis,

  ///Aprovado (irá ao ClearSale já aprovado e não será analisado)
  approved,

  ///Cancelado pelo cliente (irá ao ClearSale já cancelado e não será analisado)
  canceledByClient,

  ///Reprovado (irá ao ClearSale já reprovado e não será analisado)
  disapproved,
}

extension RequestStatusEnumExtension on RequestStatusEnum {
  static Map<RequestStatusEnum, int> get _values => const {
        RequestStatusEnum.newToAnalisis: 0,
        RequestStatusEnum.approved: 9,
        RequestStatusEnum.canceledByClient: 41,
        RequestStatusEnum.disapproved: 45,
      };
  int toMap() => _values[this];
  static RequestStatusEnum fromMap(int val) {
    if (val == null) return null;
    return _values.entries
        .firstWhere((e) => e.value == val, orElse: () => _values.entries.first)
        .key;
  }
}
