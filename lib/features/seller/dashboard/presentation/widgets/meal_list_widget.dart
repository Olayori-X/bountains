import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealList extends ConsumerWidget {
  final List<Meal>? meals;
  const MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: meals?.length ?? 0,
      separatorBuilder: (context, index) => SizedBox(height: 2.h),
      itemBuilder: (context, index) {
        final meal = meals?[index];
        return MealItem(
          data: meal,
        );
      },
    );
  }
}

class MealItem extends StatelessWidget {
  final Meal? data;

  const MealItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            return AlertDialog(
                // backgroundColor: AppColors.dialogColor,
                // title: Text(
                //   "Teacher ${isInList ? "Removed" : "Added"} Successfully",
                //   style: AppTextStyles.h4Bold.copyWith(
                //     color: AppColors.primary2Dark,
                //   ),
                // ),
                // content: Text(
                //   "This teacher was ${isInList ? "removed from" : "added to"} your list successfully.",
                //   style: AppTextStyles.title2.copyWith(
                //     color: AppColors.primary2Dark2,
                //   ),
                // ),
                // actions: [
                //   ElevatedButton(
                //     onPressed: () {
                //       Navigator.of(ctx).pop();
                //       updateMatchedTeachers(
                //         ref,
                //         widget.teacherId,
                //         widget.teacherProfile.name,
                //         widget.teacherProfile.image,
                //         widget.teacherProfile.id,
                //         "pending",
                //       );
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.dialogColor,
                //       shape: RoundedRectangleBorder(
                //         side: BorderSide(
                //           color: AppColors.primary,
                //         ),
                //         borderRadius: BorderRadius.circular(8.r),
                //       ),
                //       fixedSize: Size(120.w, 48.h),
                //     ),
                //     child: Text(
                //       "Back",
                //       style: AppTextStyles.title1Medium.copyWith(
                //         color: AppColors.primary,
                //       ),
                //     ),
                //   ),
                //   TextButton(
                //     onPressed: () {
                //       Navigator.of(ctx).pop();
                //       ref.watch(pageIndexProvider.notifier).state = 2;
                //       context.router.pushNamed(Pages.schoolDashboard);
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.primary1Normal,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8.r),
                //       ),
                //       fixedSize: Size(120.w, 48.h),
                //     ),
                //     child: Text(
                //       "My List",
                //       style: AppTextStyles.title1SemiBold.copyWith(
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ],
                );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  data?.picture != null && data!.picture!.isNotEmpty
                      ? CachedNetworkImageProvider(data!.picture!)
                      : null,
              child: data?.picture == null || data!.picture!.isEmpty
                  ? Icon(Icons.lunch_dining, color: Colors.grey[700])
                  : null,
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data!.meal,
                      style: AppTextStyles.title1Medium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(1)),
                    Text(
                      data!.quantityunit,
                      style: AppTextStyles.title2.copyWith(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(data!.price, style: AppTextStyles.title1Medium),
          ],
        ),
      ),
    );
  }
}
