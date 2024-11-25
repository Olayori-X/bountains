import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget settingsTextField({
  required WidgetRef ref,
  // required String data,
  required String labelText,
  double? height,
  double? width,
  required TextEditingController controller,
  TextInputType inputType = TextInputType.text,
  // required StateProvider provider,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.0),
      border: Border.all(color: Colors.grey),
    ),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
        fontSize: 20.0,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${labelText.toLowerCase()}';
        }
        return null;
      },
      keyboardType: inputType,
      onChanged: (value) {
        // ref.watch(provider.notifier).state = value;
      },
    ),
  );
}

Widget settingsPasswordField({
  required WidgetRef ref,
  // required String data,
  required String labelText,
  double? height,
  double? width,
  required TextEditingController controller,
  TextInputType inputType = TextInputType.visiblePassword,
  required Function(String) onChanged,
  required bool passwordVisible,
  required Function() changeVisibillity,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1.0),
      border: Border.all(color: Colors.grey),
    ),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
        fontSize: 20.0,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: changeVisibillity,
        ),
      ),
      onChanged: onChanged,
      obscureText: passwordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your ${labelText.toLowerCase()}';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    ),
  );
}
