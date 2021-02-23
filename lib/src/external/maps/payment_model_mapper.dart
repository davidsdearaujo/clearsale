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
      if (model.interestValue != null) 'date': model.date?.toIso8601String(),
      if (model.value != null) 'value': model.value,
      if (model.type != null) 'type': model.type?.toMap(),
      if (model.installments != null) 'installments': model.installments,
      if (model.interestRate != null) 'interestRate': model.interestRate,
      if (model.interestValue != null) 'interestValue': model.interestValue,
      if (model.currency != null) 'currency': model.currency,
      if (model.voucherOrderOrigin != null) 'voucherOrderOrigin': model.voucherOrderOrigin,
      if (model.address != null) 'address': AddressModelMapper.toMap(model.address),
      if (model.card != null) 'card': CardModelMapper.toMap(model.card),
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
