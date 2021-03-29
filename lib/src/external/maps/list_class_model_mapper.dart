import 'dart:convert';

import 'package:clearsale/src/domain/models/list_class_model.dart';

class ListClassModelMapper {
  static Map<String, dynamic> toMap(ListClassModel model) => {
        if (model.typeId != null) 'typeId': model.typeId?.toMap(),
        'id': model.id,
      };

  static ListClassModel fromMap(Map<String, dynamic> map) => ListClassModel(
        typeId: ListTypeEnumExtension.fromMap(map['typeId']),
        id: map['id'],
      );

  static String toJson(ListClassModel model) => json.encode(toMap(model));

  static ListClassModel fromJson(String source) => fromMap(json.decode(source));
}
