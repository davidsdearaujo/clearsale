import '../enums/payment_type_enum.dart';
import 'address_model.dart';
import 'card_model.dart';

export '../enums/payment_type_enum.dart';
export 'address_model.dart';
export 'card_model.dart';

class PaymentModel {
  ///Sequência de realização do pagamento
  int? sequential;

  ///Data do pagamento
  DateTime? date;

  ///Valor cobrado neste pagamento
  double? value;

  ///Tipo de Pagamento
  PaymentTypeEnum type;

  ///Quantidade de Parcelas
  double? installments;

  ///Taxa de Juros
  double? interestRate;

  ///Valor dos Juros
  int? interestValue;

  ///Código da moeda
  int? currency;

  ///ID do pedido que gerou vale troca (caso a forma de pagamento atual seja “Vale”)
  String? voucherOrderOrigin;

  ///Endereço pagamento
  AddressModel? address;

  ///cartão
  CardModel card;

  PaymentModel({
    this.sequential,
    this.date,
    this.value,
    required this.type,
    this.installments,
    this.interestRate,
    this.interestValue,
    this.currency,
    this.voucherOrderOrigin,
    this.address,
    required this.card,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentModel && o.sequential == sequential && o.date == date && o.value == value && o.type == type && o.installments == installments && o.interestRate == interestRate && o.interestValue == interestValue && o.currency == currency && o.voucherOrderOrigin == voucherOrderOrigin && o.address == address && o.card == card;
  }

  @override
  int get hashCode {
    return sequential.hashCode ^ date.hashCode ^ value.hashCode ^ type.hashCode ^ installments.hashCode ^ interestRate.hashCode ^ interestValue.hashCode ^ currency.hashCode ^ voucherOrderOrigin.hashCode ^ address.hashCode ^ card.hashCode;
  }

  @override
  String toString() {
    return 'PaymentModel(sequential: $sequential, date: $date, value: $value, type: $type, installments: $installments, interestRate: $interestRate, interestValue: $interestValue, currency: $currency, voucherOrderOrigin: $voucherOrderOrigin, address: $address, card: $card)';
  }
}
