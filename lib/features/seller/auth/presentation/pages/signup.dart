import 'dart:ui';

import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/text_field.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_register_use_case.dart';
import 'package:bountains/features/seller/auth/presentation/functions/signup.dart';
import 'package:bountains/features/seller/auth/presentation/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gather_go/auth/signuptwo.dart';
// import 'mainsignup.dart';

class SellerSignUp extends ConsumerStatefulWidget {
  const SellerSignUp({super.key});

  @override
  ConsumerState<SellerSignUp> createState() => _SellerSignUpState();
}

class _SellerSignUpState extends ConsumerState<SellerSignUp> {
  @override
  Widget build(BuildContext context) {
    double signupProgress = ref.watch(signupProgressProvider);

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (signupProgress == 1.0) {
          ref.read(signupProgressProvider.notifier).state = 0.5;
          print(signupProgress);
          print(ref.watch(signupProgressProvider));
          return true;
        }

        return !context.router.canPop();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (signupProgress == 1.0) {
                ref.read(signupProgressProvider.notifier).state = 0.5;
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/veggie.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bountains-high-resolution-logo-white-transparent.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                ],
              ),
            ),
            if (signupProgress == 0.5) const _StepOnePage(),
            if (signupProgress == 1.0) const _StepTwoPage(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

class _StepOnePage extends ConsumerStatefulWidget {
  const _StepOnePage({super.key});

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends ConsumerState<_StepOnePage> {
  bool _passwordVisible = true;
  bool _passwordConfirmVisible = true;

  late String datachosen;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    usernameController =
        TextEditingController(text: ref.read(usernameProvider));
    emailController = TextEditingController(text: ref.read(emailProvider));
    phoneController = TextEditingController(text: ref.read(phoneProvider));
    passwordController =
        TextEditingController(text: ref.read(passwordProvider));
    passwordConfirmController =
        TextEditingController(text: ref.read(passwordConfirmProvider));
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  bool validateSignupForm() {
    FormState? formState = formKey.currentState;
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10.0),
                  vertical: ScreenUtil().setHeight(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 23.0,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildTextField(
                            label: "Full Name",
                            controller: usernameController,
                            onChanged: (value) {
                              ref.read(usernameProvider.notifier).state = value;
                            },
                          ),
                          buildTextField(
                            label: "Email",
                            controller: emailController,
                            onChanged: (value) {
                              ref.read(emailProvider.notifier).state = value;
                            },
                          ),
                          buildTextField(
                            label: "Phone",
                            controller: phoneController,
                            onChanged: (value) {
                              ref.read(phoneProvider.notifier).state = value;
                            },
                          ),
                          buildPasswordField(
                            label: "Password",
                            controller: passwordController,
                            onChanged: (value) {
                              ref.read(passwordProvider.notifier).state = value;
                            },
                            passwordVisible: _passwordVisible,
                            changeVisibillity: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          SizedBox(height: 27.h),
                          buildPasswordField(
                            label: "Confirm Password",
                            controller: passwordConfirmController,
                            onChanged: (value) {
                              ref.read(passwordConfirmProvider.notifier).state =
                                  value;
                            },
                            passwordVisible: _passwordConfirmVisible,
                            changeVisibillity: () {
                              setState(() {
                                _passwordConfirmVisible =
                                    !_passwordConfirmVisible;
                              });
                            },
                          ),
                          const SizedBox(height: 32.0),
                          ElevatedButton(
                            onPressed: () {
                              if (!validateSignupForm()) return;
                              ref.read(signupProgressProvider.notifier).state =
                                  1.0;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColor,
                              textStyle: TextStyle(
                                color: AppColors.firstWhite,
                              ),
                              minimumSize: const Size(double.infinity, 60.0),
                              shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style: AppTextStyles.buttonText.copyWith(
                                color: AppColors.firstWhite,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an account already?",
                                style: AppTextStyles.body1SemiBold.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.router
                                      .pushReplacementNamed(Pages.sellerlogin);
                                },
                                child: Text(
                                  "Log in",
                                  style: AppTextStyles.body1SemiBold.copyWith(
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StepTwoPage extends ConsumerStatefulWidget {
  const _StepTwoPage({super.key});

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends ConsumerState<_StepTwoPage> {
  late TextEditingController addressController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController stateController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: ref.read(addressProvider));
    streetController = TextEditingController(text: ref.read(streetProvider));
    cityController = TextEditingController(text: ref.read(cityProvider));
    stateController = TextEditingController(text: ref.read(stateProvider));
  }

  @override
  void dispose() {
    addressController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  bool validateSignupForm() {
    FormState? formState = formKey.currentState;
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  void initiateRegistrationProcess() {
    String name = ref.watch(usernameProvider);
    String phone = ref.watch(phoneProvider);
    String email = ref.watch(emailProvider);
    String address = ref.watch(addressProvider);
    String state = ref.watch(stateProvider);
    String street = ref.watch(streetProvider);
    String city = ref.watch(cityProvider);
    String password = ref.watch(passwordProvider);
    String confirmpassword = ref.watch(passwordConfirmProvider);

    manualRegister(
      ref,
      ManualRegisterParams(
        fullname: name,
        email: email,
        phone: phone,
        address: address,
        street: street,
        city: city,
        state: state,
        password: password,
        passwordConfirmation: confirmpassword,
      ),
    );
  }

  void onRegistrationStateChanged() {
    ref.listen(registerStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(registerErrorMessageProvider));
      } else if (next == AppState.success) {
        context.router.pushReplacementNamed(Pages.sellerVerification);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onRegistrationStateChanged();
    bool loading = ref.watch(registerStateProvider) == AppState.loading;
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 557.h,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10.0),
                vertical: ScreenUtil().setHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23.0,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextField(
                          label: "Address",
                          controller: addressController,
                          onChanged: (value) {
                            ref.read(addressProvider.notifier).state = value;
                          },
                        ),
                        buildTextField(
                          label: "Street",
                          controller: streetController,
                          onChanged: (value) {
                            ref.read(streetProvider.notifier).state = value;
                          },
                        ),
                        buildTextField(
                          label: "City",
                          controller: cityController,
                          onChanged: (value) {
                            ref.read(cityProvider.notifier).state = value;
                          },
                        ),
                        buildTextField(
                          label: "State",
                          controller: stateController,
                          onChanged: (value) {
                            ref.read(stateProvider.notifier).state = value;
                          },
                        ),
                        const SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: () {
                            if (loading || validateSignupForm()) return;
                            initiateRegistrationProcess();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                            minimumSize: const Size(double.infinity, 60.0),
                            shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                          child: loading
                              ? whiteLoader
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.firstWhite,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
