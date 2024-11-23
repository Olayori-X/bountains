import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:bountains/features/seller/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:bountains/features/seller/auth/presentation/functions/verifyotp.dart';
import 'package:bountains/features/seller/auth/presentation/provider/signup_provider.dart';
import 'package:bountains/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOTP extends ConsumerStatefulWidget {
  const VerifyOTP({super.key});

  @override
  ConsumerState<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends ConsumerState<VerifyOTP> {
  bool validateOTPForm() {
    if (ref.watch(otpInputProvider).isEmpty) return false;
    if (ref.watch(otpInputProvider).length != 5) return false;
    return true;
  }

  void initiateVerifyOtpProcess() {
    final String otpInput = ref.watch(otpInputProvider);
    final String sellerid = serviceLocator<UserCredentials>().sellerid;

    verifyOTP(
      ref,
      VerifyParams(
        userid: sellerid,
        otp: otpInput,
      ),
    );
  }

  void onVerificationStateChanged() {
    ref.listen(otpStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(context, ref.watch(otpErrorMessageProvider));
      } else if (next == AppState.success) {
        context.router.pushReplacementNamed(Pages.sellerlogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onVerificationStateChanged();
    bool loading = ref.watch(otpStateProvider) == AppState.loading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            fontFamily: 'Aeonik',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20), // Add spacing from the top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "A code has been sent to the mail provided...",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Aeonik",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  fieldWidth: 20.w,
                  onCodeChanged: (String code) {
                    ref.watch(otpInputProvider.notifier).state = code;
                  },
                  onSubmit: (String verificationCode) {
                    ref.watch(otpInputProvider.notifier).state =
                        verificationCode;
                    if (loading) return;
                    initiateVerifyOtpProcess();
                  }, // end onSubmit
                ),
                const SizedBox(height: 10),
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Aeonik",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    if (loading || !validateOTPForm()) return;
                    initiateVerifyOtpProcess();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    textStyle: const TextStyle(color: Colors.white),
                    minimumSize: const Size(double.infinity, 60.0),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: loading
                      ? whiteLoader
                      : Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: AppColors.firstWhite,
                          ),
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0), // Add spacing between buttons
        ],
      ),
    );
  }
}
