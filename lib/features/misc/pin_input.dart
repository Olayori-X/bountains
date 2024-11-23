import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinInputField extends StatelessWidget {
  // Receiving controllers from outside
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;

  const PinInputField({
    Key? key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // First OTP digit
          SizedBox(
            height: 68,
            width: 54,
            child: TextField(
              controller: controller1, // Controller for the first field
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus(); // Move to next field
                }
              },
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Aeonik",
                fontWeight: FontWeight.w600,
              ),
              //keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                //FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          // Second OTP digit
          SizedBox(
            height: 68,
            width: 54,
            child: TextField(
              controller: controller2, // Controller for the second field
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus(); // Move to next field
                }
              },
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Aeonik",
                fontWeight: FontWeight.w600,
              ),
              //keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                //FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          // Third OTP digit
          SizedBox(
            height: 68,
            width: 54,
            child: TextField(
              controller: controller3, // Controller for the third field
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus(); // Move to next field
                }
              },
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Aeonik",
                fontWeight: FontWeight.w600,
              ),
              //keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                //FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          // Fourth OTP digit
          SizedBox(
            height: 68,
            width: 54,
            child: TextField(
              controller: controller4, // Controller for the fourth field
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context)
                      .unfocus(); // Unfocus after the last digit
                }
              },
              style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Aeonik",
                fontWeight: FontWeight.w600,
              ),
              //keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                //FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
