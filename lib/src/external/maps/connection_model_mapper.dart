import 'dart:convert';

import 'package:clearsale/src/domain/models/connection_model.dart';

class ConnectionModelMapper {
  static Map<String, dynamic> toMap(ConnectionModel model) {
    if (model == null) return null;
    return {
      'company': model.company,
      'identificationNumber': model.identificationNumber,
      'date': model.date?.millisecondsSinceEpoch,
      'seatClass': model.seatClass,
      'origin': model.origin,
      'destination': model.destination,
      'boarding': model.boarding?.millisecondsSinceEpoch,
      'arriving': model.arriving?.millisecondsSinceEpoch,
      'fareClass': model.fareClass,
    };
  }

  static ConnectionModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ConnectionModel(
      company: map['company'],
      identificationNumber: map['identificationNumber'],
      date: DateTime.tryParse(map['date']),
      seatClass: map['seatClass'],
      origin: map['origin'],
      destination: map['destination'],
      boarding: DateTime.tryParse(map['boarding']),
      arriving: DateTime.tryParse(map['arriving']),
      fareClass: map['fareClass'],
    );
  }

  static String toJson(ConnectionModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static ConnectionModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
