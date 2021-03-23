part of 'category_localization_bloc.dart';

@immutable
abstract class CategoryLocalizationEvent {}

class LoadCategoryLocalizedData extends CategoryLocalizationEvent {
  final Category category;

  LoadCategoryLocalizedData(this.category);
}
