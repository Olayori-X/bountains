import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/dashboard.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/meals/meals.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/orders.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final List<String> _categories = [
    'All',
    'Pending',
    'Completed'
  ]; //TODO this will change

  // Default value for dropdown
  String? _selectedCategory; //TODO this will chamge too

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(100, 200), // Design size (your UI design resolution)
      // allowFontScaling: false, // Disable font scaling
    );
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Add Meal',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(5),
              color: Colors.black, // Set your preferred text color here
            ),
          )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerDashboard()),
              );
            },
            icon: Icon(
              Icons.home_rounded,
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Orders()),
              );
            },
            icon: Icon(
              Icons.notes, //TODO to change later
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Meal()),
              );
            },
            icon: Icon(
              Icons.cookie, //TODO to change later
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            icon: Icon(
              Icons.settings_accessibility, //TODO to change later
              size: 45,
            ),
            color: AppColors.mainColor,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(6),
          horizontal: ScreenUtil().setWidth(4),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Meal",
                  style: TextStyle(
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
                    // border: BoxBo
                  ),
                  child: TextFormField(
                    controller: _mealController,
                    // selectionHeightStyle:
                    // BoxHeightStyle.tight,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                        // labelText: 'Username',
                        border: InputBorder.none),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 115.0,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the container
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(4, 10),
                      ),
                    ],
                    // border: BoxBo
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                const Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the container
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(6, 12),
                      ),
                    ],
                    // border: BoxBo
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    hint: Text('Select an option'),
                    icon: Icon(Icons.arrow_downward),
                    items: _categories.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(
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
                              controller: _priceController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a full name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Quantity Unit",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Background color for the container
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(6, 12),
                                ),
                              ],
                              // border: BoxBo
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedCategory,
                              hint: Text('Select an option'),
                              icon: Icon(Icons.arrow_downward),
                              items: _categories.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCategory = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                const Text(
                  "Upload Meal Image",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 115.0,
                  decoration: BoxDecoration(
                      color: Colors.white, // Background color for the container
                      borderRadius: BorderRadius.circular(10.0),
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Colors.black12,
                      //     blurRadius: 5,
                      //     offset: Offset(4, 10),
                      //   ),
                      // ],
                      border: Border.all(color: Colors.black87)),
                  child: TextFormField(
                    // controller: _usernameController,
                    // selectionHeightStyle:
                    // BoxHeightStyle.tight,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                        // labelText: 'Username',
                        border: InputBorder.none),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(7)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SellerDashboard(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    textStyle: TextStyle(color: Colors.white),
                    elevation: 0,
                    // minimumSize: Size(width, height),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.08,
                    ),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(8),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
