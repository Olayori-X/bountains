import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/presentation/functions/logout.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/change_user_details_text_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  bool _passwordVisible = true;
  bool _newPasswordVisible = true;
  bool _passwordConfirmVisible = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  void onGetDetailsStateChanged() {
    ref.listen(loginStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(context, ref.watch(loginErrorMessageProvider));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onGetDetailsStateChanged();
    final User? user = ref.watch(loginResponseProvider);

    _usernameController.text = user?.fullName ?? "";
    _emailController.text = user?.email ?? "";
    _phoneController.text = user?.phone ?? "";

    return Container(
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.all(0),
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      user?.picture != null && user!.picture!.isNotEmpty
                          ? CachedNetworkImageProvider(user.picture!)
                          : null,
                  child: user?.picture == null || user!.picture!.isEmpty
                      ? Icon(Icons.person, color: Colors.grey[700])
                      : null,
                ),
              ),
              SizedBox(height: 11.h),
              settingsTextField(
                ref: ref,
                labelText: "Username",
                controller: _usernameController,
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40.h,
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        settingsTextField(
                          ref: ref,
                          labelText: "Email",
                          controller: _emailController,
                          height: 35.h,
                          inputType: TextInputType.emailAddress,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        settingsTextField(
                          ref: ref,
                          labelText: "Phone",
                          controller: _phoneController,
                          height: 35.h,
                          inputType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              SizedBox(height: 29.h),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    elevation: 0,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.6,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  child: Text('Update', style: AppTextStyles.buttonText),
                ),
              ),
              SizedBox(height: 29.h),
              const Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 21.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 11.h),
              settingsPasswordField(
                ref: ref,
                labelText: "Current Password",
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40.h,
                controller: _currentPasswordController,
                onChanged: (value) {},
                passwordVisible: _passwordVisible,
                changeVisibillity: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: settingsPasswordField(
                      ref: ref,
                      labelText: "New Password",
                      height: 40.h,
                      controller: _newPasswordController,
                      onChanged: (value) {},
                      passwordVisible: _newPasswordVisible,
                      changeVisibillity: () {
                        setState(() {
                          _newPasswordVisible = !_newPasswordVisible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: settingsPasswordField(
                      ref: ref,
                      labelText: "Confirm New Password",
                      height: 40.h,
                      controller: _confirmNewPasswordController,
                      onChanged: (value) {},
                      passwordVisible: _passwordConfirmVisible,
                      changeVisibillity: () {
                        setState(() {
                          _passwordConfirmVisible = !_passwordConfirmVisible;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    elevation: 0,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.6,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                  ),
                  child: Text(
                    'Change',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              TextButton(
                onPressed: () async {
                  await logout(ref);
                  context.router.pushReplacementNamed(Pages.sellerlogin);
                  ref.invalidate(pageIndexProvider);
                },
                child: Text("Log out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
