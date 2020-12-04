import 'dart:convert';

import 'package:clearsale/src/domain/models/item_model.dart';

class ItemModelMapper {
  static Map<String, dynamic> toMap(ItemModel model) {
    if (model == null) return null;
    return {
      if (model.code != null) 'code': model.code,
      if (model.name != null) 'name': model.name,
      if (model.barCode != null) 'barCode': model.barCode,
      if (model.value != null) 'value': model.value,
      if (model.amount != null) 'amount': model.amount,
      if (model.categoryId != null) 'categoryID': model.categoryId,
      if (model.categoryName != null) 'categoryName': model.categoryName,
      if (model.isGift != null) 'isGift': model.isGift,
      if (model.sellerName != null) 'sellerName': model.sellerName,
      if (model.sellerDocument != null) 'sellerDocument': model.sellerDocument,
      if (model.isMarketPlace != null) 'isMarketPlace': model.isMarketPlace,
      if (model.shippingCompany != null)
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
      categoryId: map['categoryID'],
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
