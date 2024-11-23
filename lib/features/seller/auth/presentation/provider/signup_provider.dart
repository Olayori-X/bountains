import 'package:bountains/features/seller/auth/data/models/verify_otp_model.dart';
import 'package:bountains/features/seller/auth/domain/entities/user_credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bountains/core/provider/global.dart';
export 'package:bountains/core/provider/global.dart';

final StateProvider<double> signupProgressProvider =
    StateProvider((ref) => 0.5);
final addressProvider = StateProvider<String>((ref) => '');
final streetProvider = StateProvider<String>((ref) => '');
final cityProvider = StateProvider<String>((ref) => '');
final stateProvider = StateProvider<String>((ref) => '');
final countryProvider = StateProvider<String>((ref) => '');
final usernameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final phoneProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final passwordConfirmProvider = StateProvider<String>((ref) => '');

final StateProvider<AppState> registerStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> registerErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<UserCredential?> registerResponseProvider =
    StateProvider((ref) => null);

//OTP provider
final otpInputProvider = StateProvider<String>((ref) => '');

final StateProvider<AppState> otpStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> otpErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<VerifyResponse?> otpResponseProvider =
    StateProvider((ref) => null);
