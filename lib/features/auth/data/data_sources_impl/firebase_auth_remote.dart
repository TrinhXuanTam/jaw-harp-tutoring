import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/data/data_source_interfaces/remote/authentication_remote.dart';
import 'package:jews_harp/features/auth/data/models/user_model.dart';

@LazySingleton(as: IAuthenticationRemoteDataSource)
class FirebaseAuthRemote implements IAuthenticationRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
