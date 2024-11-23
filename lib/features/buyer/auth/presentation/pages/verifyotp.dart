import 'package:bountains/features/buyer/auth/presentation/pages/login.dart';
import 'package:bountains/features/misc/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bountains/features/misc/pin_input.dart'; // Update this with your actual path

class VerifyOTP extends ConsumerStatefulWidget {
  final Map<String, String?> userdata;

  const VerifyOTP({Key? key, required this.userdata}) : super(key: key);

  @override
  ConsumerState<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends ConsumerState<VerifyOTP> {
  // Controllers for each OTP field
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize:
          const Size(360, 500), // Design size (your UI design resolution)
    );

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
            padding: const EdgeInsets.symmetric(horizontal: 50),
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
                PinInputField(
                  controller1: _controller1,
                  controller2: _controller2,
                  controller3: _controller3,
                  controller4: _controller4,
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
                const SizedBox(height: 50), // Add spacing below OTP widget
                ElevatedButton(
                  onPressed: () {
                    // Collect OTP
                    String otp = _controller1.text +
                        _controller2.text +
                        _controller3.text +
                        _controller4.text;
                    if (otp.isNotEmpty && otp.length == 4) {
                      final String? userid = widget.userdata['userid'];

                      final Map<String, String?> userData = {
                        'userid': userid,
                        'otp': otp,
                      };

                      ref
                          .read(verifyProvider(userData).future)
                          .then((response) {
                        if (response['success']) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Success'),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuyerLoginPage(
                                  accountpurpose:
                                      widget.userdata['accountpurpose']),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(response['message']),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Signup failed: $error'),
                          backgroundColor: Colors.red,
                        ));
                        print(error);
                      });
                    } else {
                      // Show error if OTP is incomplete
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter the complete OTP"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(color: Colors.white),
                    minimumSize: const Size(double.infinity, 60.0),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontSize: 20.0,
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
