// import 'package:bountains/features/onboarding/pages/onboardingone.dart';
// import 'package:bountains/features/onboarding/pages/onboardingtwo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Onboarding extends StatelessWidget {
//   const Onboarding({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(
//       context,
//       designSize: Size(100, 200), // Design size (your UI design resolution)
//       // allowFontScaling: false, // Disable font scaling
//     );
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 2, // Number of screens
//         itemBuilder: (context, index) {
//           if (index == 0) {
//             return const OnboardingFirstScreen();
//           } else {
//             return const OnboardingSecondScreen(
//               accountpurpose: '',
//             );
//           }
//         },
//       ),
//     );
//   }
// }
