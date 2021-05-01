import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:meta/meta.dart';

part 'thumbnail_picker_event.dart';

part 'thumbnail_picker_state.dart';

/// Thumbnail picker state management.
@Injectable(env: [Environment.prod, Environment.dev])
class ThumbnailPickerBloc extends Bloc<ThumbnailPickerEvent, ThumbnailPickerState> {
  final PickImage _pickImage;

  ThumbnailPickerBloc(this._pickImage) : super(NoImagePickedState());

  @override
  Stream<ThumbnailPickerState> mapEventToState(
    ThumbnailPickerEvent event,
  ) async* {
    if (event is UploadScreenLoadedEvent) {
      final image = event.image;
      if (image == null)
        yield NoImagePickedState();
      else
        yield ImagePickedState(image);
    } else if (event is PickImageEvent) {
      // Open the file browser and pick image.
      final image = await _pickImage();
      if (image == null)
        yield NoImagePickedState();
      else
        yield ImagePickedState(image);
    } else if (event is RemoveImageEvent) {
      yield NoImagePickedState();
    }
  }
}
