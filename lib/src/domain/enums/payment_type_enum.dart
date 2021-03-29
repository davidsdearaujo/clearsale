///Tipo de pagamento (payment.type)
///https://api.clearsale.com.br/docs/total-totalGarantido-application#payment-type
enum PaymentTypeEnum {
  ///Cartão de Crédito
  creditCard,

  ///Boleto Bancário
  bankSlip,

  ///Débito Bancário
  bankDebit,

  ///Débito Bancário - Dinheiro
  bankDebitCash,

  ///Débito Bancário - Cheque
  bankDebitCheck,

  ///Transferência Bancária
  bankTransfer,

  ///Sedex a cobrar
  sedexToCollect,

  ///Cheque Bancário
  check,

  ///Dinheiro
  money,

  ///Financiamento
  financing,

  ///Fatura
  invoice,

  ///Cupom
  coupon,

  ///Multicheque
  multipleChecks,

  ///Outros
  others,

  ///Vale
  ticket,

  ///Cartão Presente Virtual
  virtualGiftCard,

  ///Cartão de Débito / Transferência Eletrônica (CD)
  debitCardOrWireTransfer,
}

extension PaymentTypeEnumExtension on PaymentTypeEnum {
  static Map<PaymentTypeEnum, int> get _values => const {
        PaymentTypeEnum.creditCard: 1,
        PaymentTypeEnum.bankSlip: 2,
        PaymentTypeEnum.bankDebit: 3,
        PaymentTypeEnum.bankDebitCash: 4,
        PaymentTypeEnum.bankDebitCheck: 5,
        PaymentTypeEnum.bankTransfer: 6,
        PaymentTypeEnum.sedexToCollect: 7,
        PaymentTypeEnum.check: 8,
        PaymentTypeEnum.money: 9,
        PaymentTypeEnum.financing: 10,
        PaymentTypeEnum.invoice: 11,
        PaymentTypeEnum.coupon: 12,
        PaymentTypeEnum.multipleChecks: 13,
        PaymentTypeEnum.others: 14,
        PaymentTypeEnum.ticket: 15,
        PaymentTypeEnum.virtualGiftCard: 1041,
        PaymentTypeEnum.debitCardOrWireTransfer: 4011,
      };
  int toMap() => _values[this]!;
  static PaymentTypeEnum? fromMap(int? val) {
    if (val == null) return null;
    return _values.entries.firstWhere((e) => e.value == val, orElse: () => _values.entries.first).key;
  }
}
