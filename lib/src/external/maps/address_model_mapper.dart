import 'dart:convert';

import 'package:clearsale/src/domain/models/address_model.dart';

class AddressModelMapper {
  static Map<String, dynamic> toMap(AddressModel model) {
    if (model == null) return null;
    return {
      if (model.street != null) 'street': model.street,
      if (model.number != null) 'number': model.number,
      if (model.additionalInformation != null)
        'additionalInformation': model.additionalInformation,
      if (model.county != null) 'county': model.county,
      if (model.city != null) 'city': model.city,
      if (model.state != null) 'state': model.state,
      if (model.zipcode != null) 'zipcode': model.zipcode,
      if (model.country != null) 'country': model.country,
      if (model.reference != null) 'reference': model.reference,
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
