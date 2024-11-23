import 'package:bountains/features/onboarding/routes.dart';
import 'package:bountains/features/seller/auth/presentation/routes.dart';
import 'package:bountains/features/seller/dashboard/presentation/routes.dart';
import 'package:bountains/features/seller/profile/presentation/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bountains/core/controllers/notifications.dart';
import 'package:bountains/core/database/configuration.dart';
import 'package:bountains/core/extensions/string.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/init.dart';
import 'package:timeago/timeago.dart' as time;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  initializeNotificationChannels();
  await confirmNotificationPermissions();
  await initializeAllDependencies();
  await ScreenUtil.ensureScreenSize();
  await DatabaseHandler.init();

  runApp(
    DevicePreview(
      builder: (context) => const ProviderScope(
        child: Bountains(),
      ),
    ),
  );
}

void initializeNotificationChannels() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'bountains_group',
        channelKey: 'bountains_channel_key',
        channelName: 'Teachers Bank',
        channelShowBadge: true,
        channelDescription: 'Notification channel for Bountains',
        defaultColor: AppColors.primary,
        ledColor: AppColors.secondary,
        importance: NotificationImportance.High,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'bountains_group',
        channelGroupName: 'Bountains Notification Group',
      )
    ],
    debug: true,
  );
}

Future<void> confirmNotificationPermissions() async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications()
        .requestPermissionToSendNotifications(permissions: [
      NotificationPermission.Alert,
      NotificationPermission.Sound,
      NotificationPermission.Badge,
      NotificationPermission.Vibration,
      NotificationPermission.Light,
      NotificationPermission.FullScreenIntent,
    ]);
  }
}

class Bountains extends ConsumerStatefulWidget {
  static late GoRouter router;

  const Bountains({
    super.key,
  });

  @override
  ConsumerState<Bountains> createState() => _BountainsState();
}

class _BountainsState extends ConsumerState<Bountains> {
  @override
  void initState() {
    super.initState();

    setupNavigationRoutes();
    setupNotificationListeners();

    time.setDefaultLocale('en_short');
  }

  void setupNavigationRoutes() {
    Bountains.router = GoRouter(
      initialLocation: Pages.splash.path,
      routes: [
        ...splashRoutes,
        ...onboardingRoutes,
        ...sellerAuthenticationRoutes,
        ...sellerDashboardRoutes,
        ...sellerProfileRoutes
      ],
    );
  }

  void setupNotificationListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp.router(
        title: 'Bountains',
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        themeMode: ThemeMode.light,
        routerConfig: Bountains.router,
      ),
      splitScreenMode: true,
      designSize: const Size(437, 805),
      minTextAdapt: true,
    );
  }
}
