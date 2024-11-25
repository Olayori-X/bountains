import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

final StateProvider<List<Order>> ordersProvider =
    StateProvider((ref) => orders);

List<Order> orders = List.generate(20, (index) {
  return Order(
    sellerid: 'seller_$index',
    customerid: 'customer_$index',
    orderid: 'order_$index',
    meal: 'Meal ${index + 1}',
    quantity: Random().nextInt(10) + 1,
    quantityunit: 'kg',
    price: (Random().nextDouble() * 100).roundToDouble(),
    status: index % 2 == 0 ? 'Delivered' : 'Pending',
    latitude: 37.7749 + Random().nextDouble(),
    longitude: -122.4194 + Random().nextDouble(),
  );
});
