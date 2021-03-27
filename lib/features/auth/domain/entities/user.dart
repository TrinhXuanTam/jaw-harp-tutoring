import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final Set<String> favoriteTechniques;
  final Optional<String> profilePictureUrl;

  const User({
    required this.uid,
    required this.name,
    required this.email,
    this.favoriteTechniques = const {},
    this.profilePictureUrl = const Optional.empty(),
  });

  @override
  List<Object> get props => [this.uid, this.name, this.email];
}
