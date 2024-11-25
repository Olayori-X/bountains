import 'dart:math';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<List<Meal>> mealsProvider = StateProvider((ref) => meals);

// Faker or mock data generator
final random = Random();

// List of mock categories and meals
const categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Desserts'];
const mealNames = ['Pancakes', 'Burger', 'Pizza', 'Salad', 'Ice Cream'];
const quantityUnits = ['Plates', 'Litres', 'Kilogram', 'Pieces', 'serving'];

// Generate the list of meals
final List<Meal> meals = List.generate(20, (index) {
  return Meal(
    sellerid: 'seller_${random.nextInt(100)}',
    mealid: 'meal_${random.nextInt(1000)}',
    meal: mealNames[random.nextInt(mealNames.length)],
    category: categories[random.nextInt(categories.length)],
    quantityunit: quantityUnits[random.nextInt(quantityUnits.length)],
    price: double.parse((random.nextDouble() * 10000).toStringAsFixed(2)),
    description:
        'This is a delicious ${mealNames[random.nextInt(mealNames.length)]}.',
    picture: random.nextBool()
        ? 'https://picsum.photos/200?random=${random.nextInt(100)}'
        : null,
  );
});
