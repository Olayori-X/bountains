import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/order.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/make_order_use_case.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/make_order.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/order_provider.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/buyer/dashboard/presentation/widgets/cart_container.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  void makeOrderProcess(List<Meal> meals) {
    List<Orders> mealOrdered = meals.map((meal) {
      return Orders(
        mealid: meal.mealid,
        sellerid: meal.sellerid,
        meal: meal.meal,
        quantityunit: meal.quantityunit,
        price: meal.newprice ?? meal.price,
        quantity: meal.newprice != null
            ? (double.parse(meal.newprice!) / double.parse(meal.price)).toInt()
            : 1,
      );
    }).toList();
    MakeOrderUseCaseParams orderData = MakeOrderUseCaseParams(
      buyerid: serviceLocator<UserCredentials>().sellerid,
      meals: mealOrdered,
    );
    makeOrder(ref, orderData);
  }

  void onMakeOrderStateChanged() {
    ref.listen(makeOrderStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(makeOrderErrorMessageProvider));
      } else if (next == AppState.success) {
        ref.watch(mealsProvider.notifier).state = [];
        ref.watch(pageIndexProvider.notifier).state = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onMakeOrderStateChanged();
    bool loading = ref.watch(makeOrderStateProvider) == AppState.loading;
    final List<Meal> meals = ref.watch(mealsProvider);
    double total = 0;

    meals.forEach((meal) {
      setState(() {
        total += double.parse(meal.newprice ?? meal.price);
      });
    });

    double priceOfDelivery = 2500;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: CartContainer(meal: meals[index]),
                );
              },
            ),
          ),
          if (meals.isNotEmpty)
            Column(
              children: [
                PriceContainer(
                  number: total,
                  label: "Total Price of Meal",
                ),
                PriceContainer(
                  number: priceOfDelivery,
                  label: "Price of Delivery",
                ),
                PriceContainer(
                  number: priceOfDelivery + total,
                  label: "Total Price",
                ),
                SizedBox(height: 16.h),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (loading) return;
                      makeOrderProcess(meals);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      elevation: 0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                    ),
                    child: loading
                        ? whiteLoader
                        : Text('Continue', style: AppTextStyles.buttonText),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  final double number;
  final String label;
  const PriceContainer({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: AppTextStyles.calculationText,
          ),
          SizedBox(width: 60.w),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5.r),
            ),
            constraints: BoxConstraints(
              minWidth: 150.w,
              minHeight: 41.h,
            ),
            child: Text(
              "₦${number.toString()}",
              style: AppTextStyles.calculationText,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
