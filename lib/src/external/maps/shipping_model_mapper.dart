import 'dart:convert';

import 'package:clearsale/src/domain/models/shipping_model.dart';

import 'address_model_mapper.dart';
import 'phone_model_mapper.dart';

class ShippingModelMapper {
  static Map<String, dynamic> toMap(ShippingModel model) {
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
      'deliveryType': model.deliveryType?.toMap(),
      'deliveryTime': model.deliveryTime,
      'price': model.price,
      'pickUpStoreDocument': model.pickUpStoreDocument,
    };
  }

  static ShippingModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ShippingModel(
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
          map['phones']?.map((x) => PhoneModelMapper.fromMap(x))),
      deliveryType: DeliveryTypeEnumExtension.fromMap(map['deliveryType']),
      deliveryTime: map['deliveryTime'],
      price: map['price'],
      pickUpStoreDocument: map['pickUpStoreDocument'],
    );
  }

  static String toJson(ShippingModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static ShippingModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
