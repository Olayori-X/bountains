import 'package:bountains/features/buyer/dashboard/domain/entities/vendors.dart';
import 'package:bountains/features/buyer/dashboard/presentation/pages/dashboard.dart';
import 'package:bountains/features/buyer/dashboard/presentation/pages/view_seller_catalogue.dart';
import 'package:go_router/go_router.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';

final List<GoRoute> buyerDashboardRoutes = [
  GoRoute(
    path: Pages.buyerDashboard.path,
    name: Pages.buyerDashboard,
    builder: (_, __) => const BuyerDashboard(),
  ),
  GoRoute(
    path: Pages.viewCatalogue.path,
    name: Pages.viewCatalogue,
    builder: (_, state) => ViewCataloguePage(seller: state.extra as Vendors),
  ),
];
