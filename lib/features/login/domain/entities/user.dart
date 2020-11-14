import 'package:flutter/foundation.dart';

class User {
  String id;
  String name;
  String email;
  bool isAdmin;

  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.isAdmin,
  });
}
