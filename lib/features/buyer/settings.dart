import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/cart.dart';
import 'package:bountains/features/buyer/shop.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyerSettings extends StatefulWidget {
  const BuyerSettings({super.key});

  @override
  State<BuyerSettings> createState() => _BuyerSettingsState();
}

class _BuyerSettingsState extends State<BuyerSettings> {
  final List<String> _categories = [
    'All',
    'Pending',
    'Completed'
  ]; //TODO this will change

  // Default value for dropdown
  String? _selectedCategory; //TODO this will chamge too

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mealController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
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
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(6),
          horizontal: ScreenUtil().setWidth(4),
        ),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    // // minimumSize: Size(width, height),
                    // shape: BeveledRectangleBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // ),
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[300], // Placeholder for image
                  ),
                ),
                const SizedBox(height: 4.0),
                Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: _mealController,
                    // selectionHeightStyle:
                    // BoxHeightStyle.tight,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Username',
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
                SizedBox(height: ScreenUtil().setHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'Email',
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
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextFormField(
                              controller: _phoneController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'Phone',
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
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(4)),
                Container(
                  height: 80.0,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Address',
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
                SizedBox(height: ScreenUtil().setHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedCategory,
                              hint: Text('Country'),
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
                    const SizedBox(width: 13.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedCategory,
                              hint: Text('State'),
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
                    SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedCategory,
                              hint: Text('City'),
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
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
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
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(7),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: _mealController,
                    // selectionHeightStyle:
                    // BoxHeightStyle.tight,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Current Password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(4)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextFormField(
                              controller: _emailController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'New Password',
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
                          Container(
                            height: 35.0,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(1.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextFormField(
                              controller: _phoneController,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
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
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
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
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: Text(
                      'Change',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(7),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
