import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/buyer/auth/data/datasources/buyer_manual_register_datasource.dart';
import 'package:bountains/features/buyer/auth/data/repositories/buyer_manual_register_repository_impl.dart';
import 'package:bountains/features/buyer/auth/domain/repositories/buyer_manual_register_repository.dart';
import 'package:bountains/features/buyer/auth/domain/usecases/buyer_manual_register_use_case.dart';
import 'package:bountains/features/buyer/dashboard/data/datasources/get_food_for_shop_datasource.dart';
import 'package:bountains/features/buyer/dashboard/data/datasources/make_order_datasource.dart';
import 'package:bountains/features/buyer/dashboard/data/repositories/get_food_for_shop_repository_impl.dart';
import 'package:bountains/features/buyer/dashboard/data/repositories/make_order_repository_impl.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/get_food_for_shop_repository.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/make_order_repository.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/get_food_for_shop_use_case.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/make_order_use_case.dart';
import 'package:bountains/features/general/data/datasources/get_user_details_datasource.dart';
import 'package:bountains/features/general/data/datasources/google_authentication_datasource.dart';
import 'package:bountains/features/general/data/datasources/google_continuation_datasource.dart';
import 'package:bountains/features/general/data/datasources/log_out_datasource.dart';
import 'package:bountains/features/general/data/datasources/manual_login_datasource.dart';
import 'package:bountains/features/general/data/repositories/get_user_details_repository_impl.dart';
import 'package:bountains/features/general/data/repositories/log_out_repository_impl.dart';
import 'package:bountains/features/general/domain/repositories/get_user_details_repository.dart';
import 'package:bountains/features/general/domain/repositories/log_out_repository.dart';
import 'package:bountains/features/general/domain/usecases/get_user_details_use_case.dart';
import 'package:bountains/features/general/domain/usecases/log_out_use_case.dart';
import 'package:bountains/features/seller/auth/data/datasources/manual_register_datasource.dart';
import 'package:bountains/features/general/data/datasources/verify_otp_datasource.dart';
import 'package:bountains/features/general/data/repositories/google_authentication_repository_impl.dart';
import 'package:bountains/features/general/data/repositories/google_continuation_repository_impl.dart';
import 'package:bountains/features/general/data/repositories/manual_login_repository_impl.dart';
import 'package:bountains/features/seller/auth/data/repositories/manual_register_repository_impl.dart';
import 'package:bountains/features/general/data/repositories/verify_otp_repository_impl.dart';
import 'package:bountains/features/general/domain/repositories/google_authentication_repository.dart';
import 'package:bountains/features/general/domain/repositories/google_continuation_repository.dart';
import 'package:bountains/features/general/domain/repositories/manual_login_repository.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_register_repository.dart';
import 'package:bountains/features/general/domain/repositories/verify_otp_repository.dart';
import 'package:bountains/features/general/domain/usecases/google_authentication_use_case.dart';
import 'package:bountains/features/general/domain/usecases/google_continuation_use_case.dart';
import 'package:bountains/features/general/domain/usecases/manual_login_use_case.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_register_use_case.dart';
import 'package:bountains/features/general/domain/usecases/verify_otp_use_case.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/add_meal_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_category_and_quantityunit_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_meal_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_orders_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_seller_dashboard_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/set_availability_status_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/add_meal_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/get_category_and_quantityunit_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/get_meal_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/get_orders_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/get_seller_dashboard_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/data/repositories/set_availability_status_repository_impl.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/add_meal_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_category_and_quantityunit_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_meal_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_orders_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_seller_dashboard_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/set_availability_status_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/add_meal_use_case.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_category_and_quantityunit_usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_meal_use_case.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_orders_use_case.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_seller_dashboard_usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/set_availability_status_use_case.dart';
import 'package:bountains/features/seller/profile/data/datasource/complete_vendor_profile_datasource.dart';
import 'package:bountains/features/seller/profile/data/repositories/complete_vendor_profile_repository_impl.dart';
import 'package:bountains/features/seller/profile/domain/repositories/complete_vendor_profile_repository.dart';
import 'package:bountains/features/seller/profile/domain/usecases/complete_vendor_profile_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> initializeAllDependencies() async {
  initAuthenticationDependencies();
}

void initAuthenticationDependencies() {
  serviceLocator.registerLazySingleton(() => AppTokens());
  serviceLocator
      .registerLazySingleton<UserCredentials>(() => UserCredentials());
  serviceLocator.registerLazySingleton<UserLocation>(() => UserLocation());

  // DATA SOURCES
  serviceLocator.registerFactory<ManualRegisterDataSource>(
    () => ManualRegisterRemoteDataSource(),
  );

  serviceLocator.registerFactory<BuyerManualRegisterDataSource>(
    () => BuyerManualRegisterRemoteDataSource(),
  );

  serviceLocator.registerFactory<VerifyOTPDataSource>(
    () => VerifyOTPRemoteDataSource(),
  );

  serviceLocator.registerFactory<ManualLoginDataSource>(
    () => ManualLoginRemoteDataSourceImpl(),
  );

  serviceLocator.registerFactory<CompleteVendorProfileDataSource>(
    () => CompleteVendorProfileRemoteDataSource(),
  );

  serviceLocator.registerFactory<SellerDashboardDataSource>(
    () => SellerDashboardRemoteDataSource(),
  );

  serviceLocator.registerFactory<CategoryAndQuantityUnitDataSource>(
    () => CategoryAndQuantityUnitRemoteDataSource(),
  );

  serviceLocator.registerFactory<AddMealDataSource>(
    () => AddMealRemoteDataSource(),
  );

  serviceLocator.registerFactory<GetMealsDataSource>(
    () => GetMealsRemoteDataSource(),
  );

  serviceLocator.registerFactory<MealsForShopDataSource>(
    () => MealsForShopRemoteDataSource(),
  );

  serviceLocator.registerFactory<MakeOrderDataSource>(
    () => MakeOrderRemoteDataSource(),
  );

  serviceLocator.registerFactory<GetOrdersDataSource>(
    () => GetOrdersRemoteDataSource(),
  );

  serviceLocator.registerFactory<GoogleAuthenticationDataSource>(
    () => GoogleAuthenticationRemoteDataSource(),
  );

  serviceLocator.registerFactory<GoogleContinuationDataSource>(
    () => GoogleContinuationRemoteDataSource(),
  );

  serviceLocator.registerFactory<GetUserDetailsDataSource>(
    () => GetUserDetailsRemoteDataSource(),
  );

  serviceLocator.registerFactory<LogOutDataSource>(
    () => LogOutRemoteDataSource(),
  );

  serviceLocator.registerFactory<SetAvailabilityDataSource>(
    () => SetAvailabilityRemoteDataSource(),
  );

  // REPOSITORIES
  serviceLocator.registerFactory<ManualRegisterRepository>(
    () => ManualRegisterRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<BuyerManualRegisterRepository>(
    () => BuyerManualRegisterRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<VerifyOTPRepository>(
    () => VerifyOTPRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<ManualLoginRepository>(
    () => ManualLoginRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<CompleteVendorProfileRepository>(
    () => CompleteVendorProfileRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SellerDashboardRepository>(
    () => SellerDashboardRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<CategoryAndQuantityUnitRepository>(
    () => CategoryAndQuantityUnitRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AddMealRepository>(
    () => AddMealRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetMealsRepository>(
    () => GetMealsRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<MealsForShopRepository>(
    () => MealsForShopRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<MakeOrderRepository>(
    () => MakeOrderRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetOrdersRepository>(
    () => GetOrdersRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GoogleAuthRepository>(
    () => GoogleAuthRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GoogleContinuationRepository>(
    () => GoogleContinuationRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetUserDetailsRepository>(
    () => GetUserDetailsRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LogOutRepository>(
    () => LogOutRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SetAvailabilityRepository>(
    () => SetAvailabilityRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  // USE CASES
  serviceLocator.registerFactory(
    () => ManualRegisterUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => BuyerManualRegisterUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => VerifyOTPUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => ManualLoginUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CompleteVendorProfileUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SellerDashboardUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CategoryAndQuantityUnitUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => AddMealUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetMealsUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => MealsForShopUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => MakeOrderUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetOrdersUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GoogleAuthUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GoogleContinuationUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => GetUserDetailsUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => LogOutUseCase(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SetAvailabilityUseCase(
      repository: serviceLocator(),
    ),
  );
}
