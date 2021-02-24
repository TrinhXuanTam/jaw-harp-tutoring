import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class User extends Equatable {
  final String uid;
  final String name;
  final String email;

  const User({
    @required this.uid,
    @required this.name,
    @required this.email,
  });

  Future<bool> isVerified();

  Future<void> sendVerificationEmail();

  Future<void> signOut();

  @override
  List<Object> get props => [this.uid, this.name, this.email];
}
