import 'dart:convert';

import 'package:clearsale/src/domain/models/analisys_response_model.dart';

import 'order_model_mapper.dart';

class AnalisysResponseModelMapper {
  static Map<String, dynamic> toMap(AnalisysResponseModel model) {
    if (model == null) return null;
    return {
      'packageID': model.packageID,
      'orders': model.orders?.map((x) => OrderModelMapper.toMap(x))?.toList(),
    };
  }

  static AnalisysResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return AnalisysResponseModel(
      packageID: map['packageID'],
      orders: List<OrderModel>.from(
        map['orders']?.map((x) => OrderModelMapper.fromMap(x)),
      ),
    );
  }

  static String toJson(AnalisysResponseModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static AnalisysResponseModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
