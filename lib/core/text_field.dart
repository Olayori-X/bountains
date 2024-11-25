import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextField(
    {required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
    TextInputType inputType = TextInputType.text,
    String? hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5.0),
      Container(
        height: 45.0,
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
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            fontSize: 20.0,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
          keyboardType: inputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'The $label field is required';
            }
            return null;
          },
        ),
      ),
      SizedBox(height: 27.h),
    ],
  );
}

Widget buildPasswordField({
  required String label,
  required TextEditingController controller,
  required Function(String) onChanged,
  required bool passwordVisible,
  required Function() changeVisibillity,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 18.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 5.0),
      Container(
        height: 45.0,
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
        child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
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
                return 'Please enter a password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            }),
      ),
      const SizedBox(height: 16.0),
    ],
  );
}
