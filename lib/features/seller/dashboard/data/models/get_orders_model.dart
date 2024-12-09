import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';

class GetOrdersResponse {
  final List<SellerOrders> orders;

  const GetOrdersResponse({
    required this.orders,
  });

  Map<String, dynamic> toJson() {
    return {
      "orders": orders.map((m) => m.toJson()).toList(),
    };
  }

  factory GetOrdersResponse.fromJson(Map<String, dynamic> map) {
    return GetOrdersResponse(
      orders: (map["data"] as List<dynamic>)
          .map((item) => SellerOrders.fromJson(item))
          .toList(),
    );
  }
}
