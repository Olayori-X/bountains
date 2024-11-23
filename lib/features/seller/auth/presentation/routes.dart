import 'package:bountains/features/seller/auth/presentation/pages/verifyotp.dart';
import 'package:bountains/features/seller/auth/presentation/pages/login.dart';
import 'package:bountains/features/seller/auth/presentation/pages/signup.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> sellerAuthenticationRoutes = [
  GoRoute(
    path: Pages.sellerlogin.path,
    name: Pages.sellerlogin,
    builder: (_, state) => SellerLoginPage(
      authEmail: state.extra as String?,
    ),
  ),
  GoRoute(
    path: Pages.sellersignup.path,
    name: Pages.sellersignup,
    builder: (_, __) => const SellerSignUp(),
  ),
  GoRoute(
    path: Pages.sellerVerification.path,
    name: Pages.sellerVerification,
    builder: (_, __) => const VerifyOTP(),
  ),
];
