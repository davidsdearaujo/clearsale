import 'dart:convert';

import 'package:clearsale/src/domain/models/list_class_model.dart';

class ListClassModelMapper {
  static Map<String, dynamic> toMap(ListClassModel model) {
    if (model == null) return null;
    return {
      if (model.typeId != null) 'typeId': model?.typeId?.toMap(),
      if (model.id != null) 'id': model?.id,
    };
  }

  static ListClassModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListClassModel(
      typeId: ListTypeEnumExtension.fromMap(map['typeId']),
      id: map['id'],
    );
  }

  static String toJson(ListClassModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static ListClassModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
