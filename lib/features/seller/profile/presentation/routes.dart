import 'package:bountains/features/seller/profile/presentation/pages/vendor_complete_profile.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> sellerProfileRoutes = [
  GoRoute(
    path: Pages.completeProfile.path,
    name: Pages.completeProfile,
    builder: (_, __) => const CompleteProfile(),
  ),
];
