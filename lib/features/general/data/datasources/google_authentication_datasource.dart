import 'package:bountains/features/general/data/models/google_authentication_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class GoogleAuthenticationDataSource {
  Future<GoogleAuthResponse> signInWithGoogle();
  Future<void> signOutFromGoogle();
}

class GoogleAuthenticationRemoteDataSource
    extends GoogleAuthenticationDataSource {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<GoogleAuthResponse> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    //todo You can try this out to see what the problem was
    print("Google User is ${googleUser}");
    //?! googleUser does not have a property of authentication
    String? email = googleUser?.email;
    String? displayName = googleUser?.displayName!;
    String? id = googleUser?.id;

    return GoogleAuthResponse(
      displayName: displayName,
      email: email,
      id: id,
    );
  }

  @override
  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
  }
}
