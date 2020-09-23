///### Status de pagamento
///https://api.clearsale.com.br/docs/total-totalGarantido-application#payment-status
enum PaymentStatusEnum {
  ///Pagamento Aprovado
  approved,

  ///Pagamento Reprovado
  disapproved,
}

extension PaymentStatusEnumExtension on PaymentStatusEnum {
  Map<PaymentStatusEnum, String> get _values => const {
        PaymentStatusEnum.approved: "PGA",
        PaymentStatusEnum.disapproved: "PGR",
      };
  String toMap() => _values[this];
}
