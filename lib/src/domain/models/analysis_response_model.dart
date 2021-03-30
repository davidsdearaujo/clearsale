import 'package:collection/collection.dart';

import 'order_model.dart';

export 'order_model.dart';

class AnalysisResponseModel {
  final String? packageID;
  final List<OrderModel>? orders;

  AnalysisResponseModel({
    this.packageID,
    this.orders,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is AnalysisResponseModel && o.packageID == packageID && listEquals(o.orders, orders);
  }

  @override
  int get hashCode => packageID.hashCode ^ orders.hashCode;

  @override
  String toString() => 'AnalysisResponseModel(packageID: $packageID, orders: $orders)';
}
