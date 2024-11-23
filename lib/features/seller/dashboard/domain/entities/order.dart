class Order {
  final String sellerid;
  final String customerid;
  final String orderid;
  final String meal;
  final int quantity;
  final String quantityunit;
  final double price;
  final String status;
  final double latitude;
  final double longitude;

  const Order({
    required this.sellerid,
    required this.customerid,
    required this.orderid,
    required this.meal,
    required this.quantity,
    required this.quantityunit,
    required this.price,
    required this.status,
    required this.latitude,
    required this.longitude,
  });

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      sellerid: map['sellerid']!,
      customerid: map['customerid']!,
      orderid: map['orderid']!,
      meal: map['meal']!,
      quantity: map['quantity']!,
      quantityunit: map['quantityunit']!,
      price: map['price']!,
      status: map['status']!,
      latitude: map['latitude']!,
      longitude: map['longitude']!,
    );
  }
}
