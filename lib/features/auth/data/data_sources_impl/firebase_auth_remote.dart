import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/core/errors/wrong_email_or_password_error.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

@LazySingleton(as: IAuthenticationRemoteDataSource)
class FirebaseAuthRemote extends IAuthenticationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebaseCredentials(userCredential);
    } on FirebaseAuthException {
      throw WrongEmailOrPasswordError();
    }
  }

  @override
  Future<UserModel> signUp(
    String name,
    String email,
    String password,
  ) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      user.updateProfile(displayName: name);
      // Sign out the user
      _auth.signOut();
      return UserModel.fromFirebaseUser(user);
    } on FirebaseAuthException {
      throw EmailAlreadyUsedError();
    }
  }

  @override
  Future<bool> sendVerificationEmail(String email) {
    // TODO: implement sendVerificationEmail
    throw UnimplementedError();
  }
}
