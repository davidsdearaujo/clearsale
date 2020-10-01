import 'dart:convert';

import 'package:clearsale/src/domain/models/address_model.dart';

class AddressModelMapper {
  static Map<String, dynamic> toMap(AddressModel model) {
    if (model == null) return null;
    return {
      'street': model.street,
      'number': model.number,
      'additionalInformation': model.additionalInformation,
      'county': model.county,
      'city': model.city,
      'state': model.state,
      'zipcode': model.zipcode,
      'country': model.country,
      'reference': model.reference,
    };
  }

  static AddressModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AddressModel(
      street: map['street'],
      number: map['number'],
      additionalInformation: map['additionalInformation'],
      county: map['county'],
      city: map['city'],
      state: map['state'],
      zipcode: map['zipcode'],
      country: map['country'],
      reference: map['reference'],
    );
  }

  static String toJson(AddressModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static AddressModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
