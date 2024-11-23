import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/meals/addmeal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Meal extends StatefulWidget {
  const Meal({super.key});

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMeal()),
          );
        },
        backgroundColor: AppColors.mainColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(6),
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(3),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Text(
                              'Drink',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Text(
                              'Swallows',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Text(
                              'Soup',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Text(
                              'Combo',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(6)),
                            Text(
                              'Combo',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(5),
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(5)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(2)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: ScreenUtil().setHeight(20),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // spreadRadius: 2, // Spread of the shadow
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  Colors.grey[300], // Placeholder for image
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Expanded(
                              // Use Expanded or Flexible to allow alignment to work
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Spaghetti and Turkey',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(1)),
                                    Text(
                                      'Plate',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '₦4,500',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
