import 'package:flutter/foundation.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    @required uid,
    @required name,
    @required email,
  }) : super(uid: uid, name: name, email: email);
}
