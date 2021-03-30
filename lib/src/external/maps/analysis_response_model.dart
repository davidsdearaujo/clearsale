import 'dart:convert';

import 'package:clearsale/src/domain/models/analysis_response_model.dart';

import 'order_model_mapper.dart';

class AnalysisResponseModelMapper {
  static Map<String, dynamic> toMap(AnalysisResponseModel model) {
    return {
      if (model.packageID != null) 'packageID': model.packageID,
      if (model.orders != null) 'orders': model.orders?.map((x) => OrderModelMapper.toMap(x)).toList(),
    };
  }

  static AnalysisResponseModel fromMap(Map<String, dynamic> map) {
    return AnalysisResponseModel(
      packageID: map['packageID'],
      orders: List<OrderModel>.from(
        map['orders']?.map((x) => OrderModelMapper.fromMap(x)),
      ),
    );
  }

  static String toJson(AnalysisResponseModel model) {
    return json.encode(toMap(model));
  }

  static AnalysisResponseModel fromJson(String source) {
    return fromMap(json.decode(source));
  }
}
