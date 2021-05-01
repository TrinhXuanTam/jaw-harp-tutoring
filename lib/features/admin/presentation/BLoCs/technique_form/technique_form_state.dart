part of 'technique_form_bloc.dart';

@immutable
class TechniqueFormState {
  final bool formSubmitted;
  final bool isPaid;
  final TextEditingController idController;
  final DropdownButtonFormFieldController<String> categoryController;
  final DropdownButtonFormFieldController<TechniqueDifficulty> difficultyController;
  final Map<String, TechniqueLocalizedData> localizedData;
  final ThumbnailPickerController thumbnailController;
  final VideoPickerController videoController;
  final Technique? success;

  TechniqueFormState({
    this.formSubmitted = false,
    required this.isPaid,
    required this.idController,
    required this.categoryController,
    required this.difficultyController,
    required this.localizedData,
    required this.thumbnailController,
    required this.videoController,
    this.success,
  });

  TechniqueFormState copyWith({
    bool? formSubmitted,
    bool? isPaid,
    TextEditingController? idController,
    DropdownButtonFormFieldController<String>? categoryController,
    DropdownButtonFormFieldController<TechniqueDifficulty>? difficultyController,
    Map<String, TechniqueLocalizedData>? localizedData,
    ThumbnailPickerController? thumbnailController,
    VideoPickerController? videoController,
    Technique? success,
  }) {
    return TechniqueFormState(
      formSubmitted: formSubmitted ?? this.formSubmitted,
      isPaid: isPaid ?? this.isPaid,
      idController: idController ?? this.idController,
      categoryController: categoryController ?? this.categoryController,
      difficultyController: difficultyController ?? this.difficultyController,
      localizedData: localizedData ?? this.localizedData,
      thumbnailController: thumbnailController ?? this.thumbnailController,
      videoController: videoController ?? this.videoController,
      success: success ?? this.success,
    );
  }
}
