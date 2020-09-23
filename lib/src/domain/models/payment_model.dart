import 'package:meta/meta.dart';

import '../enums/payment_type_enum.dart';
import 'address_model.dart';
import 'card_model.dart';

///### Objeto payments
///https://api.clearsale.com.br/docs/total-totalGarantido-application#payments-object
class PaymentModel {
  PaymentModel({
    this.sequential,
    this.date,
    this.value,
    @required this.type,
    this.installments,
    this.interestRate,
    this.interestValue,
    this.currency,
    this.voucherOrderOrigin,
    this.address,
    @required this.card,
  });

  ///Sequência de realização do pagamento
  int sequential;

  ///Data do pagamento
  DateTime date;

  ///Valor cobrado neste pagamento
  double value;

  ///Tipo de Pagamento
  PaymentTypeEnum type;

  ///Quantidade de Parcelas
  double installments;

  ///Taxa de Juros
  double interestRate;

  ///Valor dos Juros
  int interestValue;

  ///Código da moeda
  int currency;

  ///ID do pedido que gerou vale troca (caso a forma de pagamento atual seja “Vale”)
  String voucherOrderOrigin;

  ///Endereço pagamento
  AddressModel address;

  ///cartão
  CardModel card;
}
