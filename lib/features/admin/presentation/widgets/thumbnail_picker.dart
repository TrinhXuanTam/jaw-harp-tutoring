
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/thumbnail_picker/thumbnail_picker_bloc.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class ThumbnailPicker extends StatelessWidget {
  final ThumbnailPickerController controller;
  final double height;

  const ThumbnailPicker({
    Key? key,
    required this.controller,
    this.height = 135,
  }) : super(key: key);

  void _thumbnailPickerBlocListener(BuildContext ctx, ThumbnailPickerState state) {
    if (state is NoImagePickedState)
      controller.image = null;
    else if (state is ImagePickedState) controller.image = state.image;
  }

  Widget _thumbnailPickerBlocBuilder(BuildContext ctx, ThumbnailPickerState state) {
    if (state is ImagePickedState)
      return GestureDetector(
        onTap: () => BlocProvider.of<ThumbnailPickerBloc>(ctx).add(PickImageEvent()),
        child: Container(
          height: this.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: this.height,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: getImageFromMedia(state.image),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<ThumbnailPickerBloc>(ctx).add(RemoveImageEvent()),
                  child: Icon(
                    Icons.close_rounded,
                    color: BASE_COLOR,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: () => BlocProvider.of<ThumbnailPickerBloc>(ctx).add(PickImageEvent()),
        child: Container(
          height: this.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: BASE_COLOR,
                    size: 70,
                  ),
                  Text(
                    "Choose Thumbnail",
                    style: TextStyle(
                      color: BASE_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThumbnailPickerBloc>(
      create: (_) {
        final bloc = serviceLocator<ThumbnailPickerBloc>();
        bloc.add(UploadScreenLoadedEvent(image: controller.image));
        return bloc;
      },
      child: RoundedInputField(
        padding: EdgeInsets.zero,
        child: BlocConsumer<ThumbnailPickerBloc, ThumbnailPickerState>(
          listener: _thumbnailPickerBlocListener,
          builder: _thumbnailPickerBlocBuilder,
        ),
      ),
    );
  }
}

class ThumbnailPickerController {
  Media? image;

  ThumbnailPickerController({this.image});
}
