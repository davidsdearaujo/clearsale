import 'dart:convert';

import 'package:clearsale/src/domain/enums/person_type_enum.dart';
import 'package:clearsale/src/domain/models/billing_model.dart';
import 'package:clearsale/src/domain/models/phone_model.dart';

import 'address_model_mapper.dart';
import 'phone_model_mapper.dart';

class BillingModelMapper {
  static Map<String, dynamic> toMap(BillingModel model) {
    if (model == null) return null;
    return {
      'clientId': model.clientId,
      'type': model.type?.toMap(),
      'primaryDocument': model.primaryDocument,
      'secondaryDocument': model.secondaryDocument,
      'name': model.name,
      'birthDate': model.birthDate?.toIso8601String(),
      'email': model.email,
      'gender': model.gender?.toMap(),
      'address': AddressModelMapper.toMap(model.address),
      'phones': model.phones?.map((x) => PhoneModelMapper.toMap(x))?.toList(),
    };
  }

  static BillingModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BillingModel(
      clientId: map['clientId'],
      type: PersonTypeEnumExtension.fromMap(map['type']),
      primaryDocument: map['primaryDocument'],
      secondaryDocument: map['secondaryDocument'],
      name: map['name'],
      birthDate: DateTime.tryParse(map['birthDate']),
      email: map['email'],
      gender: GenderEnumExtension.fromMap(map['gender']),
      address: AddressModelMapper.fromMap(map['address']),
      phones: List<PhoneModel>.from(
        map['phones']?.map((x) => PhoneModelMapper.fromMap(x)),
      ),
    );
  }

  static String toJson(BillingModel model) {
    if (model == null) null;
    return json.encode(toMap(model));
  }

  static BillingModel fromJson(String source) {
    if (json == null) return null;
    return fromMap(json.decode(source));
  }
}
