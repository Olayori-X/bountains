class Meal {
  final String mealid;
  final String sellerid;
  final String meal;
  final String category;
  final String quantityunit;
  final String price;
  final String description;
  final String? picture;
  final String? newprice;

  const Meal({
    required this.mealid,
    required this.sellerid,
    required this.meal,
    required this.category,
    required this.quantityunit,
    required this.price,
    required this.description,
    this.picture,
    this.newprice,
  });

  Meal copyWith({
    String? newprice,
  }) {
    return Meal(
      mealid: mealid,
      sellerid: sellerid,
      meal: meal,
      newprice: newprice ?? price,
      price: price,
      quantityunit: quantityunit,
      category: category,
      description: description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mealid": mealid,
      "meal": meal,
      "category": category,
      "quantityunit": quantityunit,
      "price": price,
      "description": description,
      "picture": picture,
      "sellerid": sellerid,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> map) {
    return Meal(
      mealid: map['mealid'] ?? "",
      meal: map['meal'] ?? "",
      category: map['category'] ?? "",
      quantityunit: map['quantity_unit'] ?? "",
      price: map['price'] ?? "",
      description: map['description'] ?? "",
      picture: map['picture'],
      sellerid: map['sellerid'],
    );
  }
}
