import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingData {
  final String logoimage;
  final String backgroundimage;
  final String firstbuttontext;
  final String secondbuttontext;
  final VoidCallback firstfunction;
  final VoidCallback secondfunction;

  const OnboardingData(
      {required this.logoimage,
      required this.backgroundimage,
      required this.firstbuttontext,
      required this.secondbuttontext,
      required this.firstfunction,
      required this.secondfunction});
}

class OnboardingWidget extends StatelessWidget {
  final OnboardingData data;
  final bool loading;
  const OnboardingWidget(
      {super.key, required this.data, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.backgroundimage),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 60.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              data.logoimage,
              width: 200.0,
              height: 200.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: data.firstfunction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      textStyle: TextStyle(color: Colors.white),
                      minimumSize: Size(double.infinity, 65.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.r)),
                      ),
                    ),
                    child: loading
                        ? whiteLoader
                        : Text(
                            data.firstbuttontext,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: AppColors.firstWhite,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: data.secondfunction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      textStyle: TextStyle(
                        color: AppColors.firstWhite,
                      ),
                      minimumSize: Size(double.infinity, 65.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.r),
                        ),
                      ),
                    ),
                    child: Text(
                      data.secondbuttontext,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: AppColors.firstWhite,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
