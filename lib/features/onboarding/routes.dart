import 'package:bountains/features/onboarding/pages/onboarding.dart';
import 'package:bountains/features/onboarding/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> splashRoutes = [
  GoRoute(
    path: Pages.splash.path,
    name: Pages.splash,
    builder: (_, __) => const SplashScreen(),
  ),
];

final List<GoRoute> onboardingRoutes = [
  GoRoute(
    path: Pages.onboarding.path,
    name: Pages.onboarding,
    builder: (_, __) => const Onboarding(),
  ),
];
