import 'package:bountains/features/buyer/auth/presentation/pages/buyersignup.dart';
import 'package:bountains/features/buyer/auth/presentation/pages/verifyotp.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> buyerAuthenticationRoutes = [
  GoRoute(
    path: Pages.buyersignup.path,
    name: Pages.buyersignup,
    builder: (_, __) => const BuyerSignUp(),
  ),
  GoRoute(
    path: Pages.buyerVerification.path,
    name: Pages.buyerVerification,
    builder: (_, __) => const VerifyOTP(),
  ),
];
