import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/data/data_sources/interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:optional/optional.dart';

/// Firebase [IAuthenticationRemoteDataSource] implementation
@LazySingleton(as: IAuthenticationRemoteDataSource, env: [Environment.prod])
class FirebaseAuthRemote extends IAuthenticationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign in with email and password
  @override
  Future<Optional<UserModel>> getUser(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      return Optional.of(UserModel.fromFirebaseCredentials(userCredential));
    } on FirebaseAuthException {
      return Optional.empty();
    }
  }

  /// Sign up with email and password
  @override
  Future<Optional<UserModel>> createNewUser(String name, String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final user = credentials.user;

      // Save full name
      user.updateProfile(displayName: name);
      return Optional.of(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException {
      return Optional.empty();
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }
}
