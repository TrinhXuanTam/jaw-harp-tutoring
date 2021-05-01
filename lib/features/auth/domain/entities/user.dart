import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

/// User entity that represents the end users.
class User extends Equatable {
  /// User string identifier.
  final String uid;

  /// Full name.
  final String name;

  /// User email.
  final String email;

  /// Information if the user account has been verified.
  final bool isVerified;

  /// User roles.
  /// Every user has [user] role by default.
  final Set<String> roles;

  /// List of all purchased techniques.
  final Set<String> purchasedTechniques;

  /// List of favorite techniques marked by user.
  final Set<String> favoriteTechniques;

  /// Optional profile photo url.
  final Optional<String> profilePictureUrl;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    required this.isVerified,
    this.roles = const {},
    this.purchasedTechniques = const {},
    this.favoriteTechniques = const {},
    this.profilePictureUrl = const Optional.empty(),
  });

  @override
  List<Object> get props => [this.uid, this.name, this.email];
}
