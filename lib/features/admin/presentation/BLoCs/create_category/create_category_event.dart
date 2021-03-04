part of 'create_category_bloc.dart';

@immutable
abstract class CreateCategoryEvent {}

class AddCategoryLocalizationEvent extends CreateCategoryEvent {
  final CategoryLocalizedData categoryLocalizedData;

  AddCategoryLocalizationEvent(this.categoryLocalizedData);
}

class EditCategoryLocalizationEvent extends CreateCategoryEvent {
  final CategoryLocalizedData categoryLocalizedData;

  EditCategoryLocalizationEvent(this.categoryLocalizedData);
}

class RemoveCategoryLocalizationEvent extends CreateCategoryEvent {
  final String languageCode;

  RemoveCategoryLocalizationEvent(this.languageCode);
}

class CreateCategoryFormSubmittedEvent extends CreateCategoryEvent {
  final bool isVisible;

  CreateCategoryFormSubmittedEvent(this.isVisible);
}