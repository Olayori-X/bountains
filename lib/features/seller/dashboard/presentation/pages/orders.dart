import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/orders_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/orderitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Orders extends ConsumerStatefulWidget {
  const Orders({super.key});

  @override
  ConsumerState<Orders> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<Orders> {
  final List<String> _orderStatus = ['All', 'Pending', 'Completed'];

  // Default value for dropdown
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = ref.watch(ordersProvider);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(6),
          horizontal: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header and dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Orders',
                  style: AppTextStyles.h2Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    hint: Text('Select an option'),
                    icon: Icon(Icons.arrow_downward),
                    items: _orderStatus.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(9)),

            // Table header
            Container(
              color: Color(0xFFBEA6A0),
              height: 52.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ID',
                    style: AppTextStyles.h2Bold.copyWith(
                      color: AppColors.firstWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Meal',
                    style: AppTextStyles.h2Bold.copyWith(
                      color: AppColors.firstWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Status',
                    style: AppTextStyles.h2Bold.copyWith(
                      color: AppColors.firstWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),

            // Orders List
            Expanded(
              // Add Expanded here
              child: OrdersList(orders: orders),
            ),
          ],
        ),
      ),
    );
  }
}
