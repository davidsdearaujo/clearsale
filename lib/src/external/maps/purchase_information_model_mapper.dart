import 'dart:convert';

import 'package:clearsale/src/domain/models/purchase_information_model.dart';

class PurchaseInformationModelMapper {
  static Map<String, dynamic> toMap(PurchaseInformationModel model) {
    if (model == null) return null;
    return {
      if (model.lastDateInsertedMail != null)
        'lastDateInsertedMail': model?.lastDateInsertedMail?.toIso8601String(),
      if (model.lastDateChangePassword != null)
        'lastDateChangePassword':
            model?.lastDateChangePassword?.toIso8601String(),
      if (model.lastDateChangePhone != null)
        'lastDateChangePhone': model?.lastDateChangePhone?.toIso8601String(),
      if (model.lastDateChangeMobilePhone != null)
        'lastDateChangeMobilePhone':
            model?.lastDateChangeMobilePhone?.toIso8601String(),
      if (model.lastDateInsertedAddress != null)
        'lastDateInsertedAddress':
            model?.lastDateInsertedAddress?.toIso8601String(),
      if (model.purchaseLogged != null) 'purchaseLogged': model?.purchaseLogged,
      if (model.email != null) 'email': model?.email,
      if (model.login != null) 'login': model?.login,
    };
  }

  static PurchaseInformationModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PurchaseInformationModel(
      lastDateInsertedMail: DateTime.tryParse(map['lastDateInsertedMail']),
      lastDateChangePassword: DateTime.tryParse(map['lastDateChangePassword']),
      lastDateChangePhone: DateTime.tryParse(map['lastDateChangePhone']),
      lastDateChangeMobilePhone:
          DateTime.tryParse(map['lastDateChangeMobilePhone']),
      lastDateInsertedAddress:
          DateTime.tryParse(map['lastDateInsertedAddress']),
      purchaseLogged: map['purchaseLogged'],
      email: map['email'],
      login: map['login'],
    );
  }

  static String toJson(PurchaseInformationModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static PurchaseInformationModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
