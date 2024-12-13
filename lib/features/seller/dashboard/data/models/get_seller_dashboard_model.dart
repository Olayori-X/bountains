import 'package:bountains/features/general/domain/entities/user.dart';

class SellerDashboardPayload {
  final String userid;

  const SellerDashboardPayload({
    required this.userid,
  });

  Map<String, dynamic> toJson() {
    return {
      "userid": userid,
    };
  }

  factory SellerDashboardPayload.fromJson(Map<String, dynamic> map) {
    return SellerDashboardPayload(
      userid: map["userid"] ?? "",
    );
  }
}

class SellerDashboardResponse {
  final String fullname;
  final bool available;
  final String accountBalance;
  final int orders;
  final int completedorders;
  final int pendingorders;
  final int sales;
  final User user;

  const SellerDashboardResponse({
    required this.fullname,
    required this.available,
    required this.accountBalance,
    required this.orders,
    required this.completedorders,
    required this.pendingorders,
    required this.sales,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "available": available,
      "accountBalance": accountBalance,
      "orders": orders,
      "completedorders": completedorders,
      "pendingorders": pendingorders,
      "sales": sales,
    };
  }

  factory SellerDashboardResponse.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> data = map["user"] as Map<String, dynamic>;
    return SellerDashboardResponse(
      fullname: data["fullname"] ?? "",
      available: data["available"] ?? false,
      accountBalance: data["acc_bal"].toString(),
      orders: map['orders'] ?? 0,
      completedorders: map['completedorders'] ?? 0,
      pendingorders: map['pendingorders'] ?? 0,
      sales: map['sales'] ?? "",
      user: User.fromJson(data),
    );
  }
}
