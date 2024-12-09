import 'package:bountains/features/buyer/dashboard/presentation/providers/order_provider.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart'
    as buyer_meal;
import 'package:bountains/features/general/presentation/providers/google_auth_provider.dart';
import 'package:bountains/features/general/presentation/providers/logout_provider.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart'
    as login;
import 'package:bountains/features/onboarding/provider/onboarding_provider.dart';
import 'package:bountains/features/seller/auth/presentation/provider/signup_provider.dart';
import 'package:bountains/features/buyer/auth/presentation/provider/buyer_signup_provider.dart'
    as buyer_register;
import 'package:bountains/features/seller/dashboard/presentation/providers/add_meal_provider.dart'
    as add_meal;
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/orders_providers.dart';
import 'package:bountains/features/seller/profile/presentation/provider/complete_profile_provider.dart';
import 'package:bountains/features/utility/provider/location_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void logoutInvalidate(WidgetRef ref) {
  ref.invalidate(add_meal.addMealStateProvider);
  ref.invalidate(add_meal.addMealErrorMessageProvider);
  ref.invalidate(add_meal.addMealResponseProvider);
  ref.invalidate(add_meal.categoryAndQuantityUnitProvider);
  ref.invalidate(add_meal.categoryAndQuantityUnitStateProvider);
  ref.invalidate(add_meal.categoryAndQuantityUnitErrorMessageProvider);
  ref.invalidate(add_meal.mealProvider);
  ref.invalidate(add_meal.descriptionProvider);
  ref.invalidate(add_meal.selectedCategoryProvider);
  ref.invalidate(add_meal.priceProvider);
  ref.invalidate(add_meal.quantityUnitProvider);
  ref.invalidate(add_meal.mealImageFilePathProvider);
  ref.invalidate(homeDataProvider);
  ref.invalidate(dashboardStateProvider);
  ref.invalidate(dashboardErrorMessageProvider);
  ref.invalidate(setAvailabilityStatusErrorMessageProvider);
  ref.invalidate(setAvailabilityStatusStateProvider);
  ref.invalidate(availabilityProvider);
  ref.invalidate(mealsProvider);
  ref.invalidate(mealStateProvider);
  ref.invalidate(mealErrorMessageProvider);
  ref.invalidate(ordersStateProvider);
  ref.invalidate(ordersProvider);
  ref.invalidate(orderProvider);
  ref.invalidate(orderErrorMessageProvider);
  ref.invalidate(completeProfileErrorMessageProvider);
  ref.invalidate(completeProfileProgressProvider);
  ref.invalidate(completeProfileResponseProvider);
  ref.invalidate(completeProfileStateProvider);
  ref.invalidate(vendorNameProvider);
  ref.invalidate(descriptionProvider);
  ref.invalidate(addressProvider);
  ref.invalidate(streetProvider);
  ref.invalidate(cityProvider);
  ref.invalidate(stateProvider);
  ref.invalidate(countryProvider);
  ref.invalidate(accountNameProvider);
  ref.invalidate(accountNumberProvider);
  ref.invalidate(bankCodeProvider);
  ref.invalidate(bankNameProvider);
  ref.invalidate(vendorImageFilePathProvider);
  ref.invalidate(latitudeProvider);
  ref.invalidate(longitudeProvider);
  ref.invalidate(signupProgressProvider);
  ref.invalidate(usernameProvider);
  ref.invalidate(emailProvider);
  ref.invalidate(phoneProvider);
  ref.invalidate(passwordProvider);
  ref.invalidate(passwordConfirmProvider);
  ref.invalidate(registerErrorMessageProvider);
  ref.invalidate(registerResponseProvider);
  ref.invalidate(registerStateProvider);
  ref.invalidate(otpInputProvider);
  ref.invalidate(otpErrorMessageProvider);
  ref.invalidate(otpResponseProvider);
  ref.invalidate(otpStateProvider);
  ref.invalidate(onboardingProgressProvider);
  ref.invalidate(logOutStateProvider);
  ref.invalidate(logOutErrorMessageProvider);
  ref.invalidate(login.emailProvider);
  ref.invalidate(login.passwordProvider);
  ref.invalidate(login.loginErrorMessageProvider);
  ref.invalidate(login.loginResponseProvider);
  ref.invalidate(login.loginStateProvider);
  ref.invalidate(googleAuthStateProvider);
  ref.invalidate(googleAuthErrorMessageProvider);
  ref.invalidate(makeOrderErrorMessageProvider);
  ref.invalidate(makeOrderStateProvider);
  ref.invalidate(buyer_meal.mealForShopsErrorMessageProvider);
  ref.invalidate(buyer_meal.mealForShopsProvider);
  ref.invalidate(buyer_meal.mealForShopsStateProvider);
  ref.invalidate(buyer_meal.mealsProvider);
  ref.invalidate(buyer_register.emailProvider);
  ref.invalidate(buyer_register.accountTypeProvider);
  ref.invalidate(buyer_register.addressProvider);
  ref.invalidate(buyer_register.cityProvider);
  ref.invalidate(buyer_register.countryProvider);
  ref.invalidate(buyer_register.otpErrorMessageProvider);
  ref.invalidate(buyer_register.otpInputProvider);
  ref.invalidate(buyer_register.otpResponseProvider);
  ref.invalidate(buyer_register.otpStateProvider);
  ref.invalidate(buyer_register.passwordProvider);
  ref.invalidate(buyer_register.passwordConfirmProvider);
  ref.invalidate(buyer_register.phoneProvider);
  ref.invalidate(buyer_register.registerErrorMessageProvider);
  ref.invalidate(buyer_register.registerResponseProvider);
  ref.invalidate(buyer_register.registerStateProvider);
  ref.invalidate(buyer_register.stateProvider);
  ref.invalidate(buyer_register.streetProvider);
  // ref.invalidate(pageIndexProvider);
}
