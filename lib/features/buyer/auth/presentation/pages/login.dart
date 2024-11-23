import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/shop.dart';
import 'package:bountains/features/misc/functions.dart';
import 'package:bountains/features/seller/profile/presentation/pages/vendor_complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gather_go/auth/signuptwo.dart';
// import 'mainsignup.dart';

class BuyerLoginPage extends ConsumerStatefulWidget {
  final String? accountpurpose;

  const BuyerLoginPage({Key? key, required this.accountpurpose})
      : super(key: key);

  @override
  ConsumerState<BuyerLoginPage> createState() => _BuyerLoginPageState();
}

class _BuyerLoginPageState extends ConsumerState<BuyerLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(100, 200), // Design size (your UI design resolution)
      // allowFontScaling: false, // Disable font scaling
    );
    return Scaffold(
      extendBodyBehindAppBar: true, // Extends the body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            // height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/veggie.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bountains-high-resolution-logo-white-transparent.png',
                  // You can adjust the width and height of the image as needed
                  width: 200.0,
                  height: 200.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(76), // Set the starting height
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10.0),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23.0,
                          fontFamily: "poppins",
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6.0),
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
                                controller: _emailController,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email address';
                                  } else if (!value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: AppColors.firstWhite,
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
                                controller: _passwordController,
                                style: const TextStyle(
                                    // color: firstWhite,
                                    fontSize: 20.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: _passwordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 32.0),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Perform log in logic here
                                  String email = _emailController.text;
                                  String password = _passwordController.text;

                                  // Display or process the data as needed
                                  print('Email: $email, Password: $password');

                                  if (widget.accountpurpose == 'vendor') {
                                    final Map<String, String?> userData = {
                                      "email": email,
                                      "password": password
                                    };

                                    ref
                                        .read(loginProvider(userData).future)
                                        .then((response) {
                                      if (response['success']) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Success'),
                                          backgroundColor: Colors.green,
                                        ));
                                        // Navigator.pushReplacementNamed(
                                        //     context, '/otpPage');
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(response['message']),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    }).catchError((error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Signup failed: $error'),
                                        backgroundColor: Colors.red,
                                      ));
                                      print(error);
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FoodShop()),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                textStyle: TextStyle(
                                  color: AppColors.firstWhite,
                                ),
                                minimumSize: const Size(double.infinity, 60.0),
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  fontSize: 35.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.firstWhite,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // const Padding(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 20.0)),
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(4.5),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: ScreenUtil().setSp(4.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
