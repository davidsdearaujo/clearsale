import 'dart:convert';

import '../../domain/models/phone_model.dart';

class PhoneModelMapper {
  static Map<String, dynamic> toMap(PhoneModel model) {
    if (model == null) return null;
    return {
      if (model.type != null) 'type': model.type?.toMap(),
      if (model.ddi != null) 'ddi': model.ddi,
      if (model.ddd != null) 'ddd': model.ddd,
      if (model.number != null) 'number': model.number,
      if (model.extension != null) 'extension': model.extension,
    };
  }

  static PhoneModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PhoneModel(
      type: PhoneTypeEnumExtension.fromMap(map['type']),
      ddi: map['ddi'],
      ddd: map['ddd'],
      number: map['number'],
      extension: map['extension'],
    );
  }

  static String toJson(PhoneModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static PhoneModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
