import 'dart:convert';

import 'package:clearsale/src/domain/models/passenger_model.dart';

class PassengerModelMapper {
  static Map<String, dynamic> toMap(PassengerModel model) {
    if (model == null) return null;
    return {
      if (model.name != null) 'name': model.name,
      if (model.companyMileCard != null) 'companyMileCard': model.companyMileCard,
      if (model.mileCard != null) 'mileCard': model.mileCard,
      if (model.identificationType != null) 'identificationType': model.identificationType?.toMap(),
      if (model.identificationNumber != null) 'identificationNumber': model.identificationNumber,
      if (model.gender != null) 'gender': model.gender?.toMap(),
      if (model.birthdate != null) 'birthdate': model.birthdate?.toIso8601String(),
      if (model.cpf != null) 'cpf': model.cpf,
    };
  }

  static PassengerModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PassengerModel(
      name: map['name'],
      companyMileCard: map['companyMileCard'],
      mileCard: map['mileCard'],
      identificationType: IdentificationTypeEnumExtension.fromMap(map['identificationType']),
      identificationNumber: map['identificationNumber'],
      gender: GenderEnumExtension.fromMap(map['gender']),
      birthdate: DateTime.tryParse(map['birthdate']),
      cpf: map['cpf'],
    );
  }

  static String toJson(PassengerModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static PassengerModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
