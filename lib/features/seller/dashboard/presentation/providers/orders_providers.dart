import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

final StateProvider<List<SellerOrders>> ordersProvider =
    StateProvider((ref) => orders);

List<SellerOrders> orders = List.generate(20, (index) {
  return SellerOrders(
    sellerid: 'seller_$index',
    mealid: 'meal_$index',
    customerid: 'customer_$index',
    orderid: 'order_$index',
    meal: 'Meal ${index + 1}',
    quantity: (Random().nextInt(10) + 1).toString(),
    quantityunit: 'kg',
    price: ((Random().nextDouble() * 100).roundToDouble()).toString(),
    status: index % 2 == 0 ? 'Delivered' : 'Pending',
    latitude: (37.7749 + Random().nextDouble()).toString(),
    longitude: (-122.4194 + Random().nextDouble()).toString(),
  );
});

final StateProvider<AppState> ordersStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<List<SellerOrders>?> orderProvider =
    StateProvider((ref) => null);

final StateProvider<String> orderErrorMessageProvider =
    StateProvider((ref) => "");
