class Meal {
  final String sellerid;
  final String mealid;
  final String meal;
  final String category;
  final String quantityunit;
  final double price;
  final String description;
  final String? picture;

  const Meal({
    required this.sellerid,
    required this.mealid,
    required this.meal,
    required this.category,
    required this.quantityunit,
    required this.price,
    required this.description,
    required this.picture,
  });

  factory Meal.fromJson(Map<String, dynamic> map) {
    return Meal(
      sellerid: map['sellerid']!,
      mealid: map['customerid']!,
      meal: map['meal']!,
      category: map['category']!,
      quantityunit: map['quantityunit']!,
      price: map['price']!,
      description: map['description']!,
      picture: map['picture'],
    );
  }
}

class MealData {
  final List<Meal> meal;
  final List<String> categories;

  const MealData({
    required this.meal,
    required this.categories,
  });
}
