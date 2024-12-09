import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/vendors.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/shop.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RestaurantLayout extends ConsumerStatefulWidget {
  const RestaurantLayout({super.key});

  @override
  ConsumerState<RestaurantLayout> createState() => _RestaurantLayoutState();
}

class _RestaurantLayoutState extends ConsumerState<RestaurantLayout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getMealsForShopData(ref));
  }

  void onMealStateChanged() {
    ref.listen(mealForShopsStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(mealForShopsErrorMessageProvider));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onMealStateChanged();
    bool loading = mealForShopsStateProvider == AppState.loading;
    final List<Vendors> vendors =
        loading ? [] : ref.watch(mealForShopsProvider)?.vendors ?? [];

    return RefreshIndicator(
      onRefresh: () async {
        await Future(() => getMealsForShopData(ref));
      },
      edgeOffset: 3.h,
      child: vendors.isEmpty
          ? const Center(
              child: Text("No Vendor available"),
            )
          : Skeletonizer(
              enabled: loading,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vendors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.router.pushNamed(
                          Pages.viewCatalogue,
                          extra: vendors[index],
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: RestaurantContainer(vendors: vendors[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class RestaurantContainer extends StatelessWidget {
  final Vendors vendors;
  const RestaurantContainer({super.key, required this.vendors});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.w,
        height: 425.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFE6DB),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: vendors.picture != null &&
                          vendors.picture!.startsWith('http')
                      ? CachedNetworkImageProvider(vendors.picture!)
                      : AssetImage('assets/images/jollof.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(vendors.fullname),
            Text(vendors.description ?? "We sell food"),
          ],
        ),
      ),
    );
  }
}
