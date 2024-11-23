import 'dart:io';

import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/file/image_picker.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/banks.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/profile/domain/usecases/complete_vendor_profile_usecase.dart';
import 'package:bountains/features/seller/profile/presentation/functions/complete_vendor_profile.dart';
import 'package:bountains/features/seller/profile/presentation/provider/complete_profile_provider.dart';
import 'package:bountains/features/seller/profile/presentation/widgets/complete_profile_text_field.dart';
import 'package:bountains/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CompleteProfile extends ConsumerStatefulWidget {
  const CompleteProfile({super.key});

  @override
  ConsumerState<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends ConsumerState<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    double completeProfileProgress = ref.watch(completeProfileProgressProvider);

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (completeProfileProgress == 1.0) {
          ref.read(completeProfileProgressProvider.notifier).state = 0.5;
          print(completeProfileProgress);
          return true;
        }

        return !context.router.canPop();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Complete your profile',
              style: AppTextStyles.titleText
                  .copyWith(color: AppColors.primary2Dark),
            ),
          ),
          leading: null,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(
            vertical: 50.h,
            horizontal: 5.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (completeProfileProgress == 0.5) const _CompleteProfileOne(),
                if (completeProfileProgress == 1.0) const _CompleteProfileTwo(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CompleteProfileOne extends ConsumerStatefulWidget {
  const _CompleteProfileOne({super.key});

  @override
  ConsumerState<_CompleteProfileOne> createState() =>
      _CompleteProfileOneState();
}

class _CompleteProfileOneState extends ConsumerState<_CompleteProfileOne> {
  late TextEditingController vendorNameController;
  late TextEditingController descriptionController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    vendorNameController =
        TextEditingController(text: ref.read(vendorNameProvider));
    descriptionController =
        TextEditingController(text: ref.read(descriptionProvider));
  }

  @override
  void dispose() {
    vendorNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool validateProfileOneForm() {
    FormState? formState = formKey.currentState;
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    String? imageFilePath = ref.watch(vendorImageFilePathProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50.h),
                    completeProfileTextField(
                      label: "Name as a Vendor",
                      controller: vendorNameController,
                      height: 57.h,
                      onChanged: (value) {
                        ref.watch(vendorNameProvider.notifier).state = value;
                      },
                    ),
                    SizedBox(height: 25.h),
                    completeProfileTextField(
                      label: "Description",
                      controller: descriptionController,
                      height: 124.0,
                      onChanged: (value) {
                        ref.watch(descriptionProvider.notifier).state = value;
                      },
                    ),
                    SizedBox(height: 25.h),
                    const Text(
                      "Upload Cover Image",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    GestureDetector(
                      onTap: () async {
                        String? response = await pickImageFromGallery();
                        ref.watch(vendorImageFilePathProvider.notifier).state =
                            response;
                      },
                      child: Center(
                        child: Container(
                          width: 120.r,
                          height: 120.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
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
                          child: imageFilePath == null
                              ? Icon(
                                  IconsaxPlusBold.camera,
                                  color: AppColors.primary2Lighter,
                                  size: 26.r,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!validateProfileOneForm()) return;
                  ref.read(completeProfileProgressProvider.notifier).state =
                      1.0;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  textStyle: const TextStyle(color: Colors.white),
                  elevation: 0,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.08,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.firstWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompleteProfileTwo extends ConsumerStatefulWidget {
  const _CompleteProfileTwo({super.key});

  @override
  ConsumerState<_CompleteProfileTwo> createState() =>
      _CompleteProfileTwoState();
}

class _CompleteProfileTwoState extends ConsumerState<_CompleteProfileTwo> {
  late TextEditingController accountNameController;
  late TextEditingController accountNumberController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    accountNameController =
        TextEditingController(text: ref.read(accountNameProvider));
    accountNumberController =
        TextEditingController(text: ref.read(accountNumberProvider));
  }

  @override
  void dispose() {
    accountNameController.dispose();
    accountNumberController.dispose();
    super.dispose();
  }

  bool validateProfileTwoForm() {
    FormState? formState = formKey.currentState;
    print(formState);
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  void initiateProfileRegistrationProcess() {
    String vendorName = ref.watch(vendorNameProvider);
    String? description = ref.watch(descriptionProvider);
    String accountName = ref.watch(accountNameProvider);
    String accountNumber = ref.watch(accountNumberProvider);
    String? bankName = ref.watch(bankNameProvider);
    String? imageFilePath = ref.watch(vendorImageFilePathProvider);
    String? bankCode = ref.watch(bankCodeProvider);

    completeVendorProfile(
      ref,
      CompleteVendorProfileParams(
        sellerid: serviceLocator<UserCredentials>().sellerid,
        bankname: bankName,
        bankcode: bankCode,
        accountnumber: accountNumber,
        accountname: accountName,
        picture: imageFilePath,
        description: description ?? "",
        vendorname: vendorName,
      ),
    );
  }

  void onProfileRegistrationStateChanged() {
    ref.listen(completeProfileStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(completeProfileErrorMessageProvider));
      } else if (next == AppState.success) {
        context.router.pushReplacementNamed(Pages.sellerDashboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onProfileRegistrationStateChanged();
    return Form(
      key: formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bank Name",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                    alignment: Alignment.center,
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(4, 10),
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      items: banks.keys.map((String bank) {
                        return DropdownMenuItem<String>(
                          value: bank,
                          child: Text(bank),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        ref.watch(bankNameProvider.notifier).state = newValue;
                        ref.watch(bankCodeProvider.notifier).state =
                            banks[newValue];
                        print(banks[newValue]);
                      },
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    )),
                SizedBox(height: 25.h),
                completeProfileTextField(
                  label: "Account Number",
                  controller: accountNumberController,
                  height: 57.h,
                  onChanged: (value) {
                    ref.watch(accountNumberProvider.notifier).state = value;
                  },
                ),
                SizedBox(height: 25.h),
                completeProfileTextField(
                  label: "Account Name",
                  controller: accountNameController,
                  height: 57.h,
                  onChanged: (value) {
                    ref.watch(accountNameProvider.notifier).state = value;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (!validateProfileTwoForm()) return;
                initiateProfileRegistrationProcess();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                textStyle: const TextStyle(color: Colors.white),
                elevation: 0,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.08),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              child: Text(
                'Complete Profile',
                style: AppTextStyles.buttonText.copyWith(
                  color: AppColors.firstWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
