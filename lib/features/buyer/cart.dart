import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/meals/addmeal.dart';
import 'package:bountains/features/buyer/settings.dart';
import 'package:bountains/features/buyer/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _counter = 1; // Initial value is 1

  void _increment() {
    setState(() {
      _counter++; // Increment the counter
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 1) {
        _counter--; // Decrement the counter only if it's greater than 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(100, 200), // Design size (your UI design resolution)
      // allowFontScaling: false, // Disable font scaling
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(5),
            color: Colors.black, // Set your preferred text color here
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FoodShop()));
            },
            icon: const Icon(
              Icons.home_rounded,
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined, //TODO to change later
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuyerSettings()));
            },
            icon: const Icon(
              Icons.settings_accessibility, //TODO to change later
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
        ],
      ),
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
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(25),
            horizontal: ScreenUtil().setWidth(4)),
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: ScreenUtil().setHeight(20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Spaghetti and Turkey',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(0.2)),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            _increment();
                                          },
                                          icon: const Icon(Icons.add)),
                                      Text(
                                        _counter.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.only(bottom: 15),
                                        onPressed: () {
                                          _decrement();
                                        },
                                        icon: const Icon(Icons.minimize),
                                      ),
                                      Text(
                                        'Plate',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
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
    );
  }
}
