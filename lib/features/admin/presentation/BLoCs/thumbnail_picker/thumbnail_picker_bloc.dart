import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart';
import 'package:meta/meta.dart';

part 'thumbnail_picker_event.dart';

part 'thumbnail_picker_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class ThumbnailPickerBloc extends Bloc<ThumbnailPickerEvent, ThumbnailPickerState> {
  final PickImage _pickImage;

  ThumbnailPickerBloc(this._pickImage) : super(NoImagePickedState());

  @override
  Stream<ThumbnailPickerState> mapEventToState(
    ThumbnailPickerEvent event,
  ) async* {
    if (event is PickImageEvent) {
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
