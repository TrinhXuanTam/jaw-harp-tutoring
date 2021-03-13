part of 'category_form_bloc.dart';

@immutable
class CategoryFormState {
  final bool isVisible;
  final Map<String, CategoryLocalizedData> localizedData;

  CategoryFormState({
    required this.isVisible,
    required this.localizedData,
  });

  CategoryFormState copyWith({
    bool? isVisible,
    Map<String, CategoryLocalizedData>? localizedData,
    bool? success,
  }) {
    return CategoryFormState(
      isVisible: isVisible ?? this.isVisible,
      localizedData: localizedData ?? this.localizedData,
    );
  }
}

class CategoryFormSubmitted extends CategoryFormState {
  final Category category;

  CategoryFormSubmitted(this.category) : super(isVisible: category.isVisible, localizedData: category.localizedData);
}
