class Orders {
  final String mealid;
  final String sellerid;
  final String meal;
  final String quantityunit;
  final String price;
  final String? newprice;
  final int quantity;

  const Orders({
    required this.mealid,
    required this.sellerid,
    required this.meal,
    required this.quantityunit,
    required this.price,
    this.newprice,
    required this.quantity,
  });

  Orders copyWith({
    String? newprice,
  }) {
    return Orders(
      mealid: mealid,
      sellerid: sellerid,
      meal: meal,
      newprice: newprice ?? price,
      price: price,
      quantityunit: quantityunit,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mealid": mealid,
      "sellerid": sellerid,
      "meal": meal,
      "quantityunit": quantityunit,
      "price": newprice ?? price,
      "quantity": quantity,
    };
  }

  factory Orders.fromJson(Map<String, dynamic> map) {
    return Orders(
      mealid: map['mealid'] ?? "",
      sellerid: map['sellerid'] ?? "",
      meal: map['meal'] ?? "",
      quantityunit: map['quantityunit'] ?? "",
      price: map['price'] ?? "",
      quantity: map['quantity'] ?? "",
    );
  }
}
