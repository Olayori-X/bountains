import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersList extends ConsumerWidget {
  final List<Order> orders;
  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 2.h),
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderItem(
          data: order,
          index: index,
          backgroundColor:
              index.isEven ? const Color(0xFFD79384) : AppColors.mainColor,
        );
      },
    );
  }
}

class OrderItem extends StatelessWidget {
  final Order data;
  final int index;
  final Color backgroundColor;

  const OrderItem(
      {super.key,
      required this.data,
      required this.index,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        color: backgroundColor,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${index + 1}',
              style: AppTextStyles.title1Bold.copyWith(
                color: AppColors.firstWhite,
              ),
            ),
            Text(
              data.meal,
              style: AppTextStyles.title1Bold.copyWith(
                color: AppColors.firstWhite,
              ),
            ),
            Text(
              data.status,
              style: AppTextStyles.title1Bold.copyWith(
                color: AppColors.firstWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
