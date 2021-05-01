part of 'link_providers_bloc.dart';

@immutable
abstract class LinkProvidersState {
  final String email;
  final TextEditingController passwordController = TextEditingController();

  LinkProvidersState(this.email);
}

class LinkEmail extends LinkProvidersState {
  final String password;

  LinkEmail(String email, this.password) : super(email);
}

class LinkFacebook extends LinkProvidersState {
  LinkFacebook(String email) : super(email);
}
