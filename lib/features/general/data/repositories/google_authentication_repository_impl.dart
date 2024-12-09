import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/data/datasources/google_authentication_datasource.dart';
import 'package:bountains/features/general/data/models/google_authentication_model.dart';
import 'package:bountains/features/general/domain/repositories/google_authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  final GoogleAuthenticationDataSource dataSource;

  const GoogleAuthRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<dynamic, BountainsError>> signInWithGoogle() async {
    try {
      GoogleAuthResponse response = await dataSource.signInWithGoogle();
      return Either.left(response);
    } catch (error) {
      return Either.right(
        BountainsError(
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> signOutFromGoogle() async {
    await dataSource.signOutFromGoogle();
  }
}
