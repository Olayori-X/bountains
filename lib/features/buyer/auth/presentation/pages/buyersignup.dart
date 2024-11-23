import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gather_go/auth/signuptwo.dart';
// import 'mainsignup.dart';

class BuyerSignUpForm extends StatefulWidget {
  final String accountpurpose;

  const BuyerSignUpForm({Key? key, required this.accountpurpose})
      : super(key: key);

  @override
  _BuyerSignUpFormState createState() => _BuyerSignUpFormState();
}

class _BuyerSignUpFormState extends State<BuyerSignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  late String datachosen;

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
                image: AssetImage('assets/veggie.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/bountains-high-resolution-logo-white-transparent.png',
                  // You can adjust the width and height of the image as needed
                  width: 200.0,
                  height: 200.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(65), // Set the starting height
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
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 23.0,
                            fontFamily: "poppins"),
                      ),
                      const SizedBox(height: 10.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Full Name",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600),
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
                                controller: _usernameController,
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
                            const SizedBox(height: 16.0),
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
                                color: Colors
                                    .white, // Background color for the container
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
                              "Phone Number",
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
                                // border: BoxBo
                              ),
                              child: TextFormField(
                                controller: _phoneController,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid phone number';
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
                                  fontWeight: FontWeight.w600),
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
                                  // Perform sign-up logic here
                                  String username = _usernameController.text;
                                  String email = _emailController.text;
                                  String phone = _phoneController.text;
                                  String password = _passwordController.text;

                                  Map<String, String> userdata = {
                                    'fullname': username,
                                    'email': email,
                                    'phone': phone,
                                    'password': password
                                  };

                                  print('${userdata.toString()}');

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuyerLoginPage(
                                        accountpurpose: widget.accountpurpose,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.mainColor,
                                  textStyle: TextStyle(
                                    color: AppColors.firstWhite,
                                  ),
                                  minimumSize:
                                      const Size(double.infinity, 60.0),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))),
                              child: Text("Sign Up",
                                  style: AppTextStyles.buttonText.copyWith(
                                    color: AppColors.firstWhite,
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Have an account already?",
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(4.5))),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BuyerLoginPage(
                                                accountpurpose:
                                                    widget.accountpurpose,
                                              )),
                                    );
                                  },
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: ScreenUtil().setSp(4.5)),
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
