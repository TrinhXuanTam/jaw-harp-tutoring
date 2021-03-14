part of 'category_form_bloc.dart';

@immutable
abstract class CategoryFormEvent {}

class UpdateCategoryVisibility extends CategoryFormEvent {
  final bool isVisible;

  UpdateCategoryVisibility(this.isVisible);
}

class UpdateCategoryLocalization extends CategoryFormEvent {
  final CategoryLocalizedData categoryLocalizedData;

  UpdateCategoryLocalization(this.categoryLocalizedData);
}

class RemoveCategoryLocalization extends CategoryFormEvent {
  final String languageCode;

  RemoveCategoryLocalization(this.languageCode);
}

class CreateCategoryEvent extends CategoryFormEvent {}

class UpdateCategoryEvent extends CategoryFormEvent {
  final Category category;

  UpdateCategoryEvent(this.category);
}
