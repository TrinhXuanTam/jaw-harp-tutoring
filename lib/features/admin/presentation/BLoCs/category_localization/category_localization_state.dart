part of 'category_localization_bloc.dart';

@immutable
abstract class CategoryLocalizationState {}

class CategoryLocalizationLoading extends CategoryLocalizationState {}

class CategoryLocalizationLoaded extends CategoryLocalizationState {
  final Map<String, CategoryLocalizedData> localizedData;

  CategoryLocalizationLoaded(this.localizedData);
}
