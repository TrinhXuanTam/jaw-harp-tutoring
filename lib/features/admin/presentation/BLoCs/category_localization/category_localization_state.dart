part of 'category_localization_bloc.dart';

@immutable
abstract class CategoryLocalizationState {}

/// Initial state.
class CategoryLocalizationLoading extends CategoryLocalizationState {}

/// Localized data loaded from the database.
class CategoryLocalizationLoaded extends CategoryLocalizationState {
  final Map<String, CategoryLocalizedData> localizedData;

  CategoryLocalizationLoaded(this.localizedData);
}
