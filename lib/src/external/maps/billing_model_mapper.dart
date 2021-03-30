import 'dart:convert';

import 'package:clearsale/src/domain/enums/person_type_enum.dart';
import 'package:clearsale/src/domain/models/billing_model.dart';
import 'package:clearsale/src/domain/models/phone_model.dart';

import 'address_model_mapper.dart';
import 'phone_model_mapper.dart';

class BillingModelMapper {
  static Map<String, dynamic> toMap(BillingModel model) {
    return {
      if (model.clientId != null) 'clientID': model.clientId,
      if (model.type != null) 'type': model.type!.toMap(),
      'primaryDocument': model.primaryDocument,
      if (model.secondaryDocument != null) 'secondaryDocument': model.secondaryDocument,
      'name': model.name,
      if (model.birthDate != null) 'birthDate': model.birthDate?.toIso8601String(),
      if (model.email != null) 'email': model.email,
      if (model.gender != null) 'gender': model.gender?.toMap(),
      if (model.address != null) 'address': AddressModelMapper.toMap(model.address!),
      'phones': model.phones.map((x) => PhoneModelMapper.toMap(x)).toList(),
    };
  }

  static BillingModel fromMap(Map<String, dynamic> map) {
    return BillingModel(
      clientId: map['clientID'],
      type: PersonTypeEnumExtension.fromMap(map['type']),
      primaryDocument: map['primaryDocument'],
      secondaryDocument: map['secondaryDocument'],
      name: map['name'],
      birthDate: DateTime.tryParse(map['birthDate']),
      email: map['email'],
      gender: GenderEnumExtension.fromMap(map['gender']),
      address: AddressModelMapper.fromMap(map['address']),
      phones: List<PhoneModel>.from(map['phones']?.map((x) => PhoneModelMapper.fromMap(x))),
    );
  }

  static String toJson(BillingModel model) => json.encode(toMap(model));

  static BillingModel fromJson(String source) => fromMap(json.decode(source));
}
