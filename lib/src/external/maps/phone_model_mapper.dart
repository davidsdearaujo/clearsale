import 'dart:convert';

import '../../domain/models/phone_model.dart';

class PhoneModelMapper {
  static Map<String, dynamic> toMap(PhoneModel model) => {
        if (model.type != null) 'type': model.type?.toMap(),
        if (model.ddi != null) 'ddi': model.ddi,
        'ddd': model.ddd,
        'number': model.number,
        if (model.extension != null) 'extension': model.extension,
      };

  static PhoneModel fromMap(Map<String, dynamic> map) => PhoneModel(
        type: PhoneTypeEnumExtension.fromMap(map['type']),
        ddi: map['ddi'],
        ddd: map['ddd'],
        number: map['number'],
        extension: map['extension'],
      );

  static String toJson(PhoneModel model) => json.encode(toMap(model));

  static PhoneModel fromJson(String source) => fromMap(json.decode(source));
}
