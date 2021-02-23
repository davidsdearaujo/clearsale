import 'dart:convert';

import 'package:clearsale/src/domain/models/analysis_response_model.dart';

import 'order_model_mapper.dart';

class AnalysisResponseModelMapper {
  static Map<String, dynamic> toMap(AnalysisResponseModel model) {
    if (model == null) return null;
    return {
      if (model.packageID != null) 'packageID': model.packageID,
      if (model.orders != null) 'orders': model.orders?.map((x) => OrderModelMapper.toMap(x))?.toList(),
    };
  }

  static AnalysisResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return AnalysisResponseModel(
      packageID: map['packageID'],
      orders: List<OrderModel>.from(
        map['orders']?.map((x) => OrderModelMapper.fromMap(x)),
      ),
    );
  }

  static String toJson(AnalysisResponseModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static AnalysisResponseModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
