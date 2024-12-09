class SellerOrders {
  final String sellerid;
  final String mealid;
  final String customerid;
  final String orderid;
  final String meal;
  final String quantity;
  final String quantityunit;
  final String price;
  final String status;
  final String latitude;
  final String longitude;

  const SellerOrders({
    required this.sellerid,
    required this.mealid,
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

  Map<String, dynamic> toJson() {
    return {
      "mealid": mealid,
      "meal": meal,
      "customerid": customerid,
      "orderid": orderid,
      "quantity": quantity,
      "quantityunit": quantityunit,
      "price": price,
      "status": status,
      "sellerid": sellerid,
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  factory SellerOrders.fromJson(Map<String, dynamic> map) {
    return SellerOrders(
      sellerid: map['sellerid']!,
      mealid: map['mealid']!,
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
