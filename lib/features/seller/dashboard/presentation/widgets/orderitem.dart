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
              index.isEven ? const Color(0xFFD9D9D9) : AppColors.mainColor,
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      color: const Color(0xFFBEA6A0),
      height: 52.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${index + 1}',
            style: AppTextStyles.h2Bold.copyWith(
              color: AppColors.firstWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            data.meal,
            style: AppTextStyles.h2Bold.copyWith(
              color: AppColors.firstWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            data.status,
            style: AppTextStyles.h2Bold.copyWith(
              color: AppColors.firstWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
