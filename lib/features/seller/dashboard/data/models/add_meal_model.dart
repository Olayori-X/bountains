class AddMealPayload {
  final String sellerid;
  final String category;
  final String meal;
  final String price;
  final String description;
  final String quantityUnit;
  final String picture;

  AddMealPayload({
    required this.sellerid,
    required this.category,
    required this.meal,
    required this.price,
    required this.description,
    required this.quantityUnit,
    required this.picture,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
    };
  }

  factory AddMealPayload.fromJson(Map<String, dynamic> map) {
    return AddMealPayload(
      sellerid: map["userid"] ?? "",
      category: map['category'] ?? "",
      meal: map['meal'] ?? "",
      price: map['price'] ?? "",
      description: map['description'] ?? "",
      quantityUnit: map['quantityUnit'] ?? "",
      picture: map['picture'] ?? "",
    );
  }
}
