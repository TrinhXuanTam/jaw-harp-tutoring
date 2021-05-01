part of 'purchase_technique_bloc.dart';

@immutable
class PurchaseTechniqueEvent {
  final Technique technique;
  final User user;

  PurchaseTechniqueEvent(this.user, this.technique);
}
