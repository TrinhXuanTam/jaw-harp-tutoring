import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_form.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

class EditTechniqueScreenArgs {
  final Technique technique;

  EditTechniqueScreenArgs(this.technique);
}

class EditTechniqueScreen extends StatelessWidget {
  final Technique technique;

  factory EditTechniqueScreen.fromArgs(EditTechniqueScreenArgs args) {
    return EditTechniqueScreen(technique: args.technique);
  }

  const EditTechniqueScreen({Key? key, required this.technique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithSubtitle(
                titleText: "Edit Technique",
                titleSize: 35,
                subtitleText: "Edit details of your technique.",
              ),
              SizedBox(height: 20),
              BlocProvider<TechniqueFormBloc>(
                create: (ctx) => serviceLocator<TechniqueFormBloc>(
                  param1: TechniqueFormState(
                    isPaid: technique.productId.isPresent,
                    idController: TextEditingController(text: technique.productId.orElseGet(() => "")),
                    categoryController: DropdownButtonFormFieldController<String>(value: technique.categoryId),
                    difficultyController: DropdownButtonFormFieldController<TechniqueDifficulty>(value: technique.difficulty),
                    localizedData: technique.localizedData,
                    thumbnailController: ThumbnailPickerController(image: technique.thumbnail.toNullable()),
                    videoController: VideoPickerController(video: technique.video.toNullable()),
                  ),
                ),
                child: _EditTechniqueForm(technique: this.technique),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EditTechniqueForm extends StatelessWidget {
  final Technique technique;

  const _EditTechniqueForm({Key? key, required this.technique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TechniqueForm(
      submitButtonText: "Save",
      onSubmit: () => BlocProvider.of<TechniqueFormBloc>(context).add(UpdateTechniqueEvent(technique)),
      onSuccess: (technique) => Navigator.pop(context),
    );
  }
}
