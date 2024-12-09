import 'package:bountains/features/buyer/auth/domain/entities/buyer_credentials.dart';
import 'package:bountains/features/general/data/models/verify_otp_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bountains/core/provider/global.dart';
export 'package:bountains/core/provider/global.dart';

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

final StateProvider<BuyerCredential?> registerResponseProvider =
    StateProvider((ref) => null);

//OTP provider
final otpInputProvider = StateProvider<String>((ref) => '');

final StateProvider<AppState> otpStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> otpErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<VerifyResponse?> otpResponseProvider =
    StateProvider((ref) => null);
