part of 'category_localization_bloc.dart';

@immutable
abstract class CategoryLocalizationEvent {}

/// Fetch localized data on form load.
class LoadCategoryLocalizedData extends CategoryLocalizationEvent {
  final Category category;

  LoadCategoryLocalizedData(this.category);
}
