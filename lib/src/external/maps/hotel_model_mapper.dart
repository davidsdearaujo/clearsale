import 'dart:convert';

import 'package:clearsale/src/domain/models/hotel_model.dart';

class HotelModelMapper {
  static Map<String, dynamic> toMap(HotelModel model) {
    if (model == null) return null;
    return {
      'name': model.name,
      'city': model.city,
      'state': model.state,
      'country': model.country,
      'reservationDate': model.reservationDate?.toIso8601String(),
      'reserveExpirationDate': model.reserveExpirationDate?.toIso8601String(),
      'checkInDate': model.checkInDate?.toIso8601String(),
      'checkOutDate': model.checkOutDate?.toIso8601String(),
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
