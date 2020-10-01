import 'package:collection/collection.dart';

import 'order_model.dart';

export 'order_model.dart';

class AnalisysResponseModel {
  final String packageID;
  final List<OrderModel> orders;

  AnalisysResponseModel({
    this.packageID,
    this.orders,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is AnalisysResponseModel &&
        o.packageID == packageID &&
        listEquals(o.orders, orders);
  }

  @override
  int get hashCode => packageID.hashCode ^ orders.hashCode;

  @override
  String toString() =>
      'AnalisysResponseModel(packageID: $packageID, orders: $orders)';
}
