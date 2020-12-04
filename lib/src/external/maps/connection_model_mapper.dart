import 'dart:convert';

import 'package:clearsale/src/domain/models/connection_model.dart';

class ConnectionModelMapper {
  static Map<String, dynamic> toMap(ConnectionModel model) {
    if (model == null) return null;
    return {
      if (model.company != null) 'company': model.company,
      if (model.identificationNumber != null)
        'identificationNumber': model.identificationNumber,
      if (model.date != null) 'date': model.date?.millisecondsSinceEpoch,
      if (model.seatClass != null) 'seatClass': model.seatClass,
      if (model.origin != null) 'origin': model.origin,
      if (model.destination != null) 'destination': model.destination,
      if (model.boarding != null)
        'boarding': model.boarding?.millisecondsSinceEpoch,
      if (model.arriving != null)
        'arriving': model.arriving?.millisecondsSinceEpoch,
      if (model.fareClass != null) 'fareClass': model.fareClass,
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
