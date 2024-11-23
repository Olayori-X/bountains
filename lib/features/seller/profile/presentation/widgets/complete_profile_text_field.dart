import 'package:flutter/material.dart';

Widget completeProfileTextField({
  required String label,
  required TextEditingController controller,
  required Function(String) onChanged,
  TextInputType inputType = TextInputType.text,
  String? hintText,
  double? height,
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
      Material(
        elevation: 2,
        child: Container(
          height: height,
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
            // selectionHeightStyle: BoxHeightStyle.tight,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a $label';
              }
              return null;
            },
          ),
        ),
      )
    ],
  );
}
