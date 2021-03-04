part of 'create_category_bloc.dart';

@immutable
abstract class CreateCategoryEvent {}

class AddLocalizationEvent extends CreateCategoryEvent {
  final String languageCode;

  AddLocalizationEvent(this.languageCode);
}

class RemoveLocalizationEvent extends CreateCategoryEvent {
  final String languageCode;

  RemoveLocalizationEvent(this.languageCode);
}
