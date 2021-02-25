import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;

  const User({
    @required this.uid,
    @required this.name,
    @required this.email,
  });

  @override
  List<Object> get props => [this.uid, this.name, this.email];
}
