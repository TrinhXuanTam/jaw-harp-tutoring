import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_localization_form.dart';

class TechniqueLocalizationAddScreenArgs {
  final TechniqueFormBloc techniqueFormBloc;

  TechniqueLocalizationAddScreenArgs(this.techniqueFormBloc);
}

/// Add new technique localization data form.
class TechniqueLocalizationAddScreen extends StatelessWidget {
  final TechniqueFormBloc techniqueFormBloc;

  factory TechniqueLocalizationAddScreen.fromArgs(TechniqueLocalizationAddScreenArgs args) {
    return TechniqueLocalizationAddScreen(techniqueFormBloc: args.techniqueFormBloc);
  }

  const TechniqueLocalizationAddScreen({
    Key? key,
    required this.techniqueFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          child: CenteredStack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleWithSubtitle(
                    titleText: "Add Localization",
                    titleSize: 30,
                    subtitleText: "Add localized data to your technique",
                  ),
                  SizedBox(height: 20),
                  TechniqueLocalizationForm(
                    bloc: this.techniqueFormBloc,
                    submitButtonText: "Add",
                    onSubmit: (data) {
                      this.techniqueFormBloc.add(UpdateTechniqueLocalization(data));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
