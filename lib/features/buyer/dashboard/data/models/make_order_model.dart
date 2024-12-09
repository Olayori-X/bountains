import 'package:bountains/features/buyer/dashboard/domain/entities/order.dart';

class MakeOrderPayload {
  final String buyerid;
  final List<Orders> meals;
  final double latitude;
  final double longitude;

  const MakeOrderPayload({
    required this.buyerid,
    required this.meals,
    this.latitude = 0,
    this.longitude = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "buyerid": buyerid,
      "meals": meals.map((m) => m.toJson()).toList(),
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  factory MakeOrderPayload.fromJson(Map<String, dynamic> map) {
    return MakeOrderPayload(
      buyerid: map["buyerid"] ?? "",
      meals: (map["meals"] as List<dynamic>)
          .map((item) => Orders.fromJson(item))
          .toList(),
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
    );
  }
}
