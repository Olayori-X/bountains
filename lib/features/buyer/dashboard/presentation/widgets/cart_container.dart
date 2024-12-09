import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainer extends ConsumerStatefulWidget {
  final Meal meal;
  const CartContainer({super.key, required this.meal});

  @override
  ConsumerState<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends ConsumerState<CartContainer> {
  int _counter = 1;

  void _increment(id) {
    setState(() {
      _counter++;
    });
    updateMealPrice(id, _counter);
  }

  void _decrement(id) {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
    updateMealPrice(id, _counter);
  }

  void removeMeal(String mealId) {
    // Update the provider by removing the meal with the specified mealId
    ref.watch(mealsProvider.notifier).update(
          (state) => state.where((meal) => meal.mealid != mealId).toList(),
        );
  }

  void updateMealPrice(String mealId, int counter) {
    ref.watch(mealsProvider.notifier).update(
          (state) => state.map((meal) {
            if (meal.mealid == mealId) {
              return meal.copyWith(
                  newprice: (double.parse(meal.price) * counter).toString());
            }
            return meal;
          }).toList(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.meal.mealid),
      onDismissed: (direction) {
        removeMeal(widget.meal.mealid);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30.w,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 77.h,
        decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35.r,
              backgroundImage: widget.meal.picture != null &&
                      widget.meal.picture!.startsWith('http')
                  ? CachedNetworkImageProvider(widget.meal.picture!)
                  : AssetImage('assets/images/jollof.png'),
              child: widget.meal.picture == null || widget.meal.picture!.isEmpty
                  ? Icon(Icons.person, color: Colors.grey[700])
                  : null,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.meal.meal,
                      style: AppTextStyles.littlebuttonText.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0.1),
                            onPressed: () {
                              _increment(widget.meal.mealid);
                            },
                            icon: const Icon(Icons.add)),
                        Text(
                          _counter.toString(),
                          style: AppTextStyles.body1Medium,
                        ),
                        IconButton(
                          padding: EdgeInsets.only(bottom: 15.h),
                          onPressed: () {
                            _decrement(widget.meal.mealid);
                          },
                          icon: const Icon(Icons.minimize),
                        ),
                        Text(
                          widget.meal.quantityunit,
                          style: AppTextStyles.title2Bold.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.meal.newprice ?? widget.meal.price,
              style: AppTextStyles.littlebuttonText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
