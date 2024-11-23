import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/cart.dart';
import 'package:bountains/features/buyer/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodShop extends StatefulWidget {
  const FoodShop({super.key});

  @override
  State<FoodShop> createState() => _FoodShopState();
}

class _FoodShopState extends State<FoodShop> {
  // Function to handle swipe up action
  void _onSwipeUp(String imageName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Swiped up on $imageName')),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize:
          const Size(100, 200), // Design size (your UI design resolution)
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 35.0, // Height for the search bar
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6DB),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        centerTitle: true, // Ensures the search bar is centered
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodShop()));
                  },
                  child: Text(
                    'Food',
                    style: TextStyle(
                      color: const Color(0xFFFFE6DB),
                      fontSize: ScreenUtil().setSp(6),
                    ),
                  ),
                  // color: mainColor,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodShop()));
                  },
                  child: Text(
                    'Vendor',
                    style: TextStyle(
                      color: const Color(0xFFFFE6DB),
                      fontSize: ScreenUtil().setSp(6),
                    ),
                  ),
                  // color: mainColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodShop()));
                  },
                  icon: const Icon(
                    Icons.home_rounded,
                    size: 45,
                  ),
                  // color: mainColor,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined, //TODO to change later
                    size: 45,
                  ),
                  // color: mainColor,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyerSettings()));
                  },
                  icon: const Icon(
                    Icons.settings_accessibility, //TODO to change later
                    size: 45,
                  ),
                  // color: mainColor,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.shopColor, // Assign the gradient variable here
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    // Swipe up detected
                    _onSwipeUp('Jollof');
                  }
                },
                child: Image.asset(
                  'assets/jollof.png',
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(120),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    // Swipe up detected
                    _onSwipeUp('Veggie');
                  }
                },
                child: Image.asset(
                  'assets/veggie.png',
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(120),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    // Swipe up detected
                    _onSwipeUp('Veggie');
                  }
                },
                child: Image.asset(
                  'assets/veggie.png',
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setHeight(120),
                  fit: BoxFit.cover,
                ),
              ),
              // Add more images as needed
            ],
          ),
        ),
      ),
    );
  }
}
