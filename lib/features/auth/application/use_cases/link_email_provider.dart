import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/test_environments.dart';
import 'package:jews_harp/core/errors/validation_error.dart';
import 'package:jews_harp/core/regex.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/facade_interfaces/user_facade_interface.dart';

@LazySingleton(env: [Environment.prod, Environment.dev, LINK_EMAIL_PROVIDER_TEST_ENV])
class LinkEmailProvider {
  final IUserFacade _userFacade;

  LinkEmailProvider(this._userFacade);

  Future<User> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) throw ValidationError("Please fill out all fields!");

    if (!RegExMatchers.email.hasMatch(email)) throw ValidationError("Invalid email format!");

    if (!RegExMatchers.password.hasMatch(password)) throw ValidationError("Invalid password format!");

    return _userFacade.linkAccountToEmail(email, password);
  }
}
