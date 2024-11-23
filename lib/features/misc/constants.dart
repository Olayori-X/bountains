import 'package:bountains/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kyctextstyle = TextStyle(
  fontSize: ScreenUtil().setSp(5),
  fontFamily: "Aeonik",
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

AppBar appbar = AppBar(
  backgroundColor: Colors.white,
  title: Text(
    'Hi, Olayori',
    style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: ScreenUtil().setSp(5),
      color: Colors.black, // Set your preferred text color here
    ),
  ),
  actions: [
    ElevatedButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const DashBoard()),
        // );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        minimumSize: Size(
          ScreenUtil().setWidth(25),
          ScreenUtil().setHeight(2),
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 15,
            color: Colors.redAccent[700],
          ),
          Text(
            'Check in',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(4.0),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 10), // Add space after the button if needed
  ],
);
