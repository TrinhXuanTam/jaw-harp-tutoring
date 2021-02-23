import 'package:jews_harp/features/auth/data/models/user_model.dart';
import 'package:optional/optional.dart';

/// Authentication local data source interface
abstract class IAuthenticationLocalDataSource {
  /// Get the current signed in user
  Future<Optional<UserModel>> getCurrentUser();
}
