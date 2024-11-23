import 'package:bountains/features/seller/dashboard/presentation/pages/dashboard.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> sellerDashboardRoutes = [
  GoRoute(
    path: Pages.sellerDashboard.path,
    name: Pages.sellerDashboard,
    builder: (_, __) => const SellerDashboard(),
  ),
];
