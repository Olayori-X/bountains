import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<List<Meal>> mealsProvider = StateProvider((ref) => []);

// // Faker or mock data generator
// final random = Random();

// // List of mock categories and meals
// const category = ['Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Desserts'];
// const mealNames = ['Pancakes', 'Burger', 'Pizza', 'Salad', 'Ice Cream'];
// const quantityUnits = ['Plates', 'Litres', 'Kilogram', 'Pieces', 'serving'];

// // Generate the list of meals
// final List<Meal> meals = List.generate(20, (index) {
//   return Meal(
//     sellerid: "",
//     mealid: 'meal_${random.nextInt(1000)}',
//     meal: mealNames[random.nextInt(mealNames.length)],
//     category: category[random.nextInt(category.length)],
//     quantityunit: quantityUnits[random.nextInt(quantityUnits.length)],
//     price: (random.nextDouble() * 10000).toStringAsFixed(2),
//     description:
//         'This is a delicious ${mealNames[random.nextInt(mealNames.length)]}.',
//     picture: 'https://picsum.photos/200?random=${random.nextInt(100)}',
//   );
// });

final StateProvider<AppState> mealForShopsStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<MealsForShopResponse?> mealForShopsProvider =
    StateProvider((ref) => null);

final StateProvider<String> mealForShopsErrorMessageProvider =
    StateProvider((ref) => "");
