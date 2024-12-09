import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/order.dart';
import 'package:bountains/features/seller/dashboard/presentation/functions/get_orders.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/orders_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/orderitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Orders extends ConsumerStatefulWidget {
  const Orders({super.key});

  @override
  ConsumerState<Orders> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<Orders> {
  final List<String> _orderStatus = ['All', 'Pending', 'Completed'];

  String selectedStatus = "All";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getOrderData(ref));
  }

  void onOrderStateChanged() {
    ref.listen(ordersStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(context, ref.watch(orderErrorMessageProvider));
      } else if (next == AppState.success) {
        print('yeah');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onOrderStateChanged();
    bool loading = ref.watch(ordersStateProvider) == AppState.loading;

    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final List<SellerOrders> orders = ref.watch(orderProvider) ?? [];

    final List<SellerOrders> filteredOrders = selectedStatus == 'All'
        ? orders
        : orders
            .where((order) =>
                order.status.toLowerCase() == selectedStatus.toLowerCase())
            .toList();
    return RefreshIndicator(
      onRefresh: () async {
        await Future(() => getOrderData(ref));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          // vertical: ScreenUtil().setHeight(6),
          horizontal: 5.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    value: selectedStatus,
                    hint: const Text('Select'),
                    icon: const Icon(IconsaxPlusBold.arrow_down_1),
                    items: _orderStatus.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedStatus = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.h),

            Container(
              color: const Color(0xFFBEA6A0),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                    'Quantity',
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
              child: OrdersList(orders: filteredOrders),
            ),
          ],
        ),
      ),
    );
  }
}
