import 'dart:io';

import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/file/image_picker.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/add_meal_use_case.dart';
import 'package:bountains/features/seller/dashboard/presentation/functions/addmeal.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/add_meal_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/seller/profile/presentation/widgets/complete_profile_text_field.dart';
import 'package:bountains/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class AddMeal extends ConsumerStatefulWidget {
  const AddMeal({super.key});

  @override
  ConsumerState<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends ConsumerState<AddMeal> {
  CategoryAndQuantityUnitResponse? categoryData;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getCategoryAndQuantityUnitData(ref));
  }

  bool validateMealForm() {
    FormState? formState = _formKey.currentState;
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  void initiateAddMealProcess() {
    String meal = ref.watch(mealProvider);
    String description = ref.watch(descriptionProvider);
    String category = ref.watch(selectedCategoryProvider);
    String price = ref.watch(priceProvider);
    String quantityUnit = ref.watch(quantityUnitProvider);
    String? imageFilePath = ref.watch(mealImageFilePathProvider);

    addMeal(
      ref,
      AddMealParams(
        sellerid: serviceLocator<UserCredentials>().sellerid,
        category: category,
        meal: meal,
        price: price,
        quantityUnit: quantityUnit,
        picture: imageFilePath ?? "",
        description: description,
      ),
    );
  }

  void onAddMealStateChanged() {
    ref.listen(addMealStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(addMealErrorMessageProvider));
      } else if (next == AppState.success) {
        _mealController.text = "";
        _descriptionController.text = "";
        ref.watch(selectedCategoryProvider.notifier).state = "";
        _priceController.text = "";
        ref.watch(quantityUnitProvider.notifier).state = "";
        ref.watch(mealImageFilePathProvider.notifier).state = "";
        ref.watch(pageIndexProvider.notifier).state = 2;
        context.router.pushNamed(Pages.sellerDashboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onAddMealStateChanged();
    ref.listen(categoryAndQuantityUnitStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(categoryAndQuantityUnitErrorMessageProvider));
      } else if (next == AppState.success) {
        setState(() {
          categoryData = ref.watch(categoryAndQuantityUnitProvider);
        });
      }
    });
    bool loading =
        ref.watch(categoryAndQuantityUnitStateProvider) == AppState.loading;

    bool addLoading = ref.watch(addMealStateProvider) == AppState.loading;

    String? selectedCategory = ref.watch(selectedCategoryProvider);
    String? selectedUnit = ref.watch(quantityUnitProvider);
    String? imageFilePath = ref.watch(mealImageFilePathProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Meal',
          style: AppTextStyles.title1Medium.copyWith(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 37.h,
          horizontal: 28.w,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                completeProfileTextField(
                  label: "Meal",
                  controller: _mealController,
                  onChanged: (value) {
                    ref.watch(mealProvider.notifier).state = value;
                  },
                  height: 57.h,
                ),
                SizedBox(height: 35.h),
                completeProfileTextField(
                  label: "Description",
                  maxLines: 3,
                  controller: _descriptionController,
                  onChanged: (value) {
                    ref.watch(descriptionProvider.notifier).state = value;
                  },
                  height: 124.h,
                ),
                SizedBox(height: 35.h),
                Text(
                  "Category",
                  style: AppTextStyles.title1Medium.copyWith(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 11.h),
                Container(
                  height: 57.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(6, 12),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: loading
                        ? ""
                        : (categoryData?.categories
                                    .contains(selectedCategory) ==
                                true
                            ? selectedCategory
                            : null),
                    hint: loading
                        ? const Text('Loading')
                        : const Text('Select an option'),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: categoryData?.categories.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      ref.watch(selectedCategoryProvider.notifier).state =
                          newValue.toString();
                    },
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          completeProfileTextField(
                            label: "Price",
                            controller: _priceController,
                            onChanged: (value) {
                              ref.watch(priceProvider.notifier).state = value;
                            },
                            height: 57.h,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantity Unit",
                            style: AppTextStyles.title1Medium.copyWith(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 11.h),
                          Container(
                            height: 57.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(6, 12),
                                ),
                              ],
                            ),
                            child: DropdownButton(
                              isExpanded: true,
                              value: loading
                                  ? ""
                                  : (categoryData?.quantityunit
                                              .contains(selectedUnit) ==
                                          true
                                      ? selectedUnit
                                      : null),
                              hint: loading
                                  ? const Text('Loading')
                                  : const Text('Select an option'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: categoryData?.quantityunit.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                ref.watch(quantityUnitProvider.notifier).state =
                                    newValue.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                const Text(
                  "Upload Meal Image",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5.0),
                Container(
                  child: GestureDetector(
                    onTap: () async {
                      String? response = await pickImageFromGallery();
                      ref.watch(mealImageFilePathProvider.notifier).state =
                          response;
                    },
                    child: Container(
                      height: 115.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black87),
                        // shape: BoxShape.circle,
                        color: imageFilePath == null
                            ? AppColors.primary2Normal
                            : null,
                        image: imageFilePath != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(imageFilePath),
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: imageFilePath == ""
                          ? Icon(
                              IconsaxPlusBold.camera,
                              color: AppColors.primary2Lighter,
                              size: 50.r,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 26.h),
                ElevatedButton(
                  onPressed: () {
                    if (!validateMealForm() || addLoading) return;
                    initiateAddMealProcess();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    textStyle: AppTextStyles.buttonText.copyWith(
                      color: const Color(0xFFF2F2F2),
                    ),
                    elevation: 0,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      66.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  child: addLoading
                      ? whiteLoader
                      : Text(
                          'Add',
                          style: AppTextStyles.buttonText.copyWith(
                            color: const Color(0xFFF2F2F2),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
