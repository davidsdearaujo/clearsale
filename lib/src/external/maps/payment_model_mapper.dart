import 'dart:convert';

import 'package:clearsale/src/domain/enums/payment_type_enum.dart';
import 'package:clearsale/src/domain/models/payment_model.dart';

import 'address_model_mapper.dart';
import 'card_model_mapper.dart';

class PaymentModelMapper extends PaymentModel {
  static Map<String, dynamic> toMap(PaymentModel model) {
    if (model == null) return null;
    return {
      if (model.sequential != null) 'sequential': model.sequential,
      'date': model.date?.toIso8601String(),
      if (model.value != null) 'value': model.value,
      'type': model.type?.toMap(),
      if (model.installments != null) 'installments': model.installments,
      'interestRate': model.interestRate,
      'interestValue': model.interestValue,
      if (model.currency != null) 'currency': model.currency,
      'voucherOrderOrigin': model.voucherOrderOrigin,
      'address': AddressModelMapper.toMap(model.address),
      'card': CardModelMapper.toMap(model.card),
    };
  }

  static PaymentModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PaymentModel(
      sequential: map['sequential'],
      date: DateTime.tryParse(map['date']),
      value: map['value'],
      type: PaymentTypeEnumExtension.fromMap(map['type']),
      installments: map['installments'],
      interestRate: map['interestRate'],
      interestValue: map['interestValue'],
      currency: map['currency'],
      voucherOrderOrigin: map['voucherOrderOrigin'],
      address: AddressModelMapper.fromMap(map['address']),
      card: CardModelMapper.fromMap(map['card']),
    );
  }

  static String toJson(PaymentModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static PaymentModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
