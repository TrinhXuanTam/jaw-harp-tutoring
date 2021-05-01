import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_localization/technique_localization_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_form.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

class EditTechniqueScreenArgs {
  final Technique technique;
  final void Function(BuildContext ctx) onClose;

  EditTechniqueScreenArgs(this.technique, this.onClose);
}

class EditTechniqueScreen extends StatelessWidget {
  final Technique technique;
  final void Function(BuildContext ctx) onClose;

  factory EditTechniqueScreen.fromArgs(EditTechniqueScreenArgs args) {
    return EditTechniqueScreen(
      technique: args.technique,
      onClose: args.onClose,
    );
  }

  const EditTechniqueScreen({Key? key, required this.technique, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniqueLocalizationBloc>(
      create: (_) => serviceLocator<TechniqueLocalizationBloc>()..add(LoadTechniqueLocalizedData(this.technique)),
      child: BlocBuilder<TechniqueLocalizationBloc, TechniqueLocalizationState>(builder: (ctx, state) {
        if (state is TechniqueLocalizationLoaded)
          return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: IconAppBar(
              onPressed: () => this.onClose(context),
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
                          categoryController: DropdownButtonFormFieldController<String>(value: technique.category.id),
                          difficultyController: DropdownButtonFormFieldController<TechniqueDifficulty>(value: technique.difficulty),
                          localizedData: state.localizedData,
                          thumbnailController: ThumbnailPickerController(image: technique.thumbnail.toNullable()),
                          videoController: VideoPickerController(video: technique.video.toNullable()),
                        ),
                      ),
                      child: Builder(
                        builder: (ctx) => TechniqueForm(
                          submitButtonText: "Save",
                          onSubmit: () => BlocProvider.of<TechniqueFormBloc>(ctx).add(UpdateTechniqueEvent(this.technique)),
                          onSuccess: (_) => this.onClose(ctx),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        else
          return LoadingScreen();
      }),
    );
  }
}
