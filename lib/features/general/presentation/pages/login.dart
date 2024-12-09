import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/file/file_handler.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/functions/focus.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/text_field.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:bountains/features/onboarding/pages/onboarding.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/usecases/manual_login_use_case.dart';
import 'package:bountains/features/general/presentation/functions/login.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:bountains/features/utility/functions/get_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class SellerLoginPage extends ConsumerStatefulWidget {
  final String? authEmail;
  const SellerLoginPage({
    super.key,
    this.authEmail,
  });

  @override
  ConsumerState<SellerLoginPage> createState() => _SellerLoginPageState();
}

class _SellerLoginPageState extends ConsumerState<SellerLoginPage> {
  bool _passwordVisible = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getCurrentLocation());
    if (widget.authEmail != null) {
      Future.delayed(Duration.zero,
          () => setState(() => emailController.text = widget.authEmail!));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initiateLoginProcess() {
    unFocus();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    manualLogin(
      ref,
      ManualLoginParams(
        email: email,
        password: password,
        latitude: GetIt.I<UserLocation>().latitude,
        longitude: GetIt.I<UserLocation>().longitude,
      ),
    );
  }

  bool validateLoginForm() {
    FormState? formState = formKey.currentState;
    if (formState == null) return false;
    if (!formState.validate()) return false;
    formState.save();
    return true;
  }

  void onAuthenticationStateChanged() {
    ref.listen(loginStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(context, ref.watch(loginErrorMessageProvider));
      } else if (next == AppState.success) {
        User user = ref.watch(loginResponseProvider)!;
        showSnackBarWithMessage(
          context,
          "Welcome back, ${user.fullName}",
          backgroundColor: AppColors.mainColor,
        );
        saveAuthDetails();
        navigate(user);
      }
    });
  }

  void saveAuthDetails() {
    // String email = emailController.text.trim();
    Map<String, String> auth = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };
    FileHandler.saveAuthDetails(auth);
  }

  void navigate(User user) {
    String destination = "";
    print(user);

    if (user.isVerified == null) {
      destination = Pages.sellerVerification;
    } else {
      if (user.role == 'vendor') {
        if (user.accountname == null) {
          destination = Pages.completeProfile;
        } else {
          destination = Pages.sellerDashboard;
        }
      } else {
        destination = Pages.buyerDashboard;
      }
    }

    ref.watch(loginStateProvider.notifier).state = AppState.initial;
    context.router.pushReplacementNamed(destination);
  }

  @override
  Widget build(BuildContext context) {
    onAuthenticationStateChanged();
    bool loading = ref.watch(loginStateProvider) == AppState.loading;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          SafeArea(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10.0),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Log in",
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildTextField(
                              controller: emailController,
                              label: "Email",
                              onChanged: (value) {
                                ref.watch(emailProvider.notifier).state = value;
                              },
                              hintText: 'Enter your email',
                              inputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16.0),
                            buildPasswordField(
                              label: "Password",
                              controller: passwordController,
                              onChanged: (value) {
                                ref.read(passwordProvider.notifier).state =
                                    value;
                              },
                              passwordVisible: _passwordVisible,
                              changeVisibillity: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            SizedBox(height: 56.h),
                            ElevatedButton(
                              onPressed: () {
                                if (loading || !validateLoginForm()) return;
                                initiateLoginProcess();
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
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.firstWhite,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: AppTextStyles.body1SemiBold.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Onboarding(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: AppTextStyles.body1SemiBold.copyWith(
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 90.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
