import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/onboarding/provider/onboarding_provider.dart';
import 'package:bountains/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  ConsumerState<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  @override
  Widget build(BuildContext context) {
    double onboardingProgress = ref.watch(onboardingProgressProvider);

    if (onboardingProgress == 0.5) {
      return const Scaffold(
        body: _OnboardingFirstScreen(),
      );
    } else {
      return const Scaffold(
        body: _OnboardingSecondScreen(),
      );
    }
  }
}

class _OnboardingFirstScreen extends ConsumerStatefulWidget {
  const _OnboardingFirstScreen({super.key});

  @override
  ConsumerState<_OnboardingFirstScreen> createState() =>
      _OnboardingFirstScreenState();
}

class _OnboardingFirstScreenState
    extends ConsumerState<_OnboardingFirstScreen> {
  late OnboardingData data;

  @override
  void initState() {
    super.initState();

    // Initialize the OnboardingData instance inside initState where ref can be accessed
    data = OnboardingData(
      logoimage:
          "assets/images/bountains-high-resolution-logo-white-transparent.png",
      backgroundimage: "assets/images/jollof.png",
      firstbuttontext: "Place an Order",
      secondbuttontext: "Sign Up as Vendor",
      firstfunction: () {
        ref.read(accountTypeProvider.notifier).state = "Buyer";
        ref.read(onboardingProgressProvider.notifier).state = 1.0;
      },
      secondfunction: () {
        ref.read(accountTypeProvider.notifier).state = "Vendor";
        ref.read(onboardingProgressProvider.notifier).state = 1.0;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(data: data);
  }
}

class _OnboardingSecondScreen extends ConsumerStatefulWidget {
  const _OnboardingSecondScreen({super.key});

  @override
  ConsumerState<_OnboardingSecondScreen> createState() =>
      _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState
    extends ConsumerState<_OnboardingSecondScreen> {
  late OnboardingData data;

  @override
  void initState() {
    super.initState();

    data = OnboardingData(
      logoimage:
          "assets/images/bountains-high-resolution-logo-white-transparent.png",
      backgroundimage: "assets/images/veggie.png",
      firstbuttontext: "Sign up with Google",
      secondbuttontext: "Continue Manually",
      firstfunction: () {
        context.router.pushNamed(Pages.sellerlogin);
      },
      secondfunction: () {
        if (ref.watch(accountTypeProvider.notifier).state == "Vendor")
          context.router.pushNamed(Pages.sellersignup);
        // if(ref.watch(accountTypeProvider.notifier).state == "Buyer") context.router.pushNamed(Pages.sellersignup);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: OnboardingWidget(data: data),
    );
  }
}
