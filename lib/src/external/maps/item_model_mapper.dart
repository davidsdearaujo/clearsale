import 'dart:convert';

import 'package:clearsale/src/domain/models/item_model.dart';

class ItemModelMapper {
  static Map<String, dynamic> toMap(ItemModel model) {
    if (model == null) return null;
    return {
      'code': model.code,
      'name': model.name,
      'barCode': model.barCode,
      'value': model.value,
      'amount': model.amount,
      'categoryId': model.categoryId,
      'categoryName': model.categoryName,
      'isGift': model.isGift,
      'sellerName': model.sellerName,
      'sellerDocument': model.sellerDocument,
      'isMarketPlace': model.isMarketPlace,
      'shippingCompany': model.shippingCompany,
    };
  }

  static ItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ItemModel(
      code: map['code'],
      name: map['name'],
      barCode: map['barCode'],
      value: map['value'],
      amount: map['amount'],
      categoryId: map['categoryId'],
      categoryName: map['categoryName'],
      isGift: map['isGift'],
      sellerName: map['sellerName'],
      sellerDocument: map['sellerDocument'],
      isMarketPlace: map['isMarketPlace'],
      shippingCompany: map['shippingCompany'],
    );
  }

  static String toJson(ItemModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static ItemModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
