import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/add_meal_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/features/seller/profile/presentation/widgets/complete_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMeal extends ConsumerStatefulWidget {
  const AddMeal({super.key});

  @override
  ConsumerState<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends ConsumerState<AddMeal> {
  String? _selectedCategory;

  String? _selectedUnit;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    hint: const Text('Select an option'),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: categories.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      ref.watch(selectedCategoryProvider.notifier).state =
                          newValue;
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
                              // border: BoxBo
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedUnit,
                              hint: const Text('Select an option'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: quantityUnits.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                ref.watch(quantityUntProvider.notifier).state =
                                    newValue;
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
                  height: 115.0,
                  decoration: BoxDecoration(
                      color: Colors.white, // Background color for the container
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black87)),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                        // labelText: 'Username',
                        border: InputBorder.none),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 26.h),
                ElevatedButton(
                  onPressed: () {},
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
                  child: Text(
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
