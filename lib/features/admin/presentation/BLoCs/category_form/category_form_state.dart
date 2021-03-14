part of 'category_form_bloc.dart';

@immutable
class CategoryFormState {
  final bool isVisible;
  final Map<String, CategoryLocalizedData> localizedData;
  final Category? success;

  CategoryFormState({
    required this.isVisible,
    required this.localizedData,
    this.success,
  });

  CategoryFormState copyWith({
    bool? isVisible,
    Map<String, CategoryLocalizedData>? localizedData,
    Category? success,
  }) {
    return CategoryFormState(
      isVisible: isVisible ?? this.isVisible,
      localizedData: localizedData ?? this.localizedData,
      success: success ?? this.success,
    );
  }
}
