part of 'category_form_bloc.dart';

@immutable
abstract class CategoryFormEvent {}

/// Update visibility status of the category.
/// If [isVisible] is set to [false],
/// the category and its contents will be
/// hidden to the users.
class UpdateCategoryVisibility extends CategoryFormEvent {
  final bool isVisible;

  UpdateCategoryVisibility(this.isVisible);
}

/// Update localization data of the category.
class UpdateCategoryLocalization extends CategoryFormEvent {
  final CategoryLocalizedData categoryLocalizedData;

  UpdateCategoryLocalization(this.categoryLocalizedData);
}

/// Delete localization of given [languageCode].
class RemoveCategoryLocalization extends CategoryFormEvent {
  final String languageCode;

  RemoveCategoryLocalization(this.languageCode);
}

/// Create a new category from the submitted form.
class CreateCategoryEvent extends CategoryFormEvent {}

/// Update an existing category.
class UpdateCategoryEvent extends CategoryFormEvent {
  final Category category;

  UpdateCategoryEvent(this.category);
}
