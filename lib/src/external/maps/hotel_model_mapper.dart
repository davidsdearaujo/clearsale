import 'dart:convert';

import 'package:clearsale/src/domain/models/hotel_model.dart';

class HotelModelMapper {
  static Map<String, dynamic> toMap(HotelModel model) {
    if (model == null) return null;
    return {
      if (model.name != null) 'name': model.name,
      if (model.city != null) 'city': model.city,
      if (model.state != null) 'state': model.state,
      if (model.country != null) 'country': model.country,
      if (model.reservationDate != null) 'reservationDate': model.reservationDate?.toIso8601String(),
      if (model.reserveExpirationDate != null) 'reserveExpirationDate': model.reserveExpirationDate?.toIso8601String(),
      if (model.checkInDate != null) 'checkInDate': model.checkInDate?.toIso8601String(),
      if (model.checkOutDate != null) 'checkOutDate': model.checkOutDate?.toIso8601String(),
    };
  }

  static HotelModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return HotelModel(
      name: map['name'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      reservationDate: DateTime.tryParse(map['reservationDate']),
      reserveExpirationDate: DateTime.tryParse(map['reserveExpirationDate']),
      checkInDate: DateTime.tryParse(map['checkInDate']),
      checkOutDate: DateTime.tryParse(map['checkOutDate']),
    );
  }

  static String toJson(HotelModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static HotelModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
