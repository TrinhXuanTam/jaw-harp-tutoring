part of 'category_form_bloc.dart';

@immutable
class CategoryFormState {
  final bool isVisible;
  final Map<String, CategoryLocalizedData> localizedData;
  final ThumbnailPickerController thumbnailController;
  final Category? success;

  CategoryFormState({
    required this.isVisible,
    required this.localizedData,
    required this.thumbnailController,
    this.success,
  });

  CategoryFormState copyWith({
    bool? isVisible,
    Map<String, CategoryLocalizedData>? localizedData,
    ThumbnailPickerController? thumbnailController,
    Category? success,
  }) {
    return CategoryFormState(
      isVisible: isVisible ?? this.isVisible,
      localizedData: localizedData ?? this.localizedData,
      thumbnailController: thumbnailController ?? this.thumbnailController,
      success: success ?? this.success,
    );
  }
}
