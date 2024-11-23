import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/auth/data/datasources/manual_login_datasource.dart';
import 'package:bountains/features/seller/auth/data/datasources/manual_register_datasource.dart';
import 'package:bountains/features/seller/auth/data/datasources/verify_otp_datasource.dart';
import 'package:bountains/features/seller/auth/data/repositories/manual_login_repository_impl.dart';
import 'package:bountains/features/seller/auth/data/repositories/manual_register_repository_impl.dart';
import 'package:bountains/features/seller/auth/data/repositories/verify_otp_repository_impl.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_login_repository.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_register_repository.dart';
import 'package:bountains/features/seller/auth/domain/repositories/verify_otp_repository.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_login_use_case.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_register_use_case.dart';
import 'package:bountains/features/seller/auth/domain/usecases/verify_otp_use_case.dart';
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

  // DATA SOURCES
  serviceLocator.registerFactory<ManualRegisterDataSource>(
    () => ManualRegisterRemoteDataSource(),
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

  // REPOSITORIES
  serviceLocator.registerFactory<ManualRegisterRepository>(
    () => ManualRegisterRepositoryImpl(
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

  // USE CASES
  serviceLocator.registerFactory(
    () => ManualRegisterUseCase(
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
}
