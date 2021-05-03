import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_localization_form.dart';

class TechniqueLocalizationEditScreenArgs {
  final TechniqueLocalizedData data;
  final TechniqueFormBloc techniqueFormBloc;

  TechniqueLocalizationEditScreenArgs({required this.data, required this.techniqueFormBloc});
}

/// Edit technique localization data form.
class TechniqueLocalizationEditScreen extends StatelessWidget {
  final TechniqueLocalizedData data;
  final TechniqueFormBloc techniqueFormBloc;

  factory TechniqueLocalizationEditScreen.fromArgs(TechniqueLocalizationEditScreenArgs args) {
    return TechniqueLocalizationEditScreen(
      data: args.data,
      techniqueFormBloc: args.techniqueFormBloc,
    );
  }

  const TechniqueLocalizationEditScreen({
    Key? key,
    required this.data,
    required this.techniqueFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
                  TitleWithSubtitle(
                    titleText: "Edit Localization",
                    titleSize: 30,
                    subtitleText: l10n.translate("Edit localized data for") + " " + l10n.translate(SupportedLanguages.getName(this.data.languageCode)).toLowerCase(),
                  ),
                  const SizedBox(height: 20),
                  TechniqueLocalizationForm(
                    bloc: this.techniqueFormBloc,
                    data: this.data,
                    submitButtonText: "Save",
                    onSubmit: (newData) {
                      this.techniqueFormBloc.add(UpdateTechniqueLocalization(newData));
                      Navigator.pop(context);
                    },
                  ),
                  if (this.data.languageCode != ENGLISH_CODE)
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        RoundedButton(
                          text: "Remove",
                          color: Colors.redAccent[200]!,
                          textColor: Colors.white,
                          borderColor: Colors.redAccent[200]!,
                          onPressed: () {
                            this.techniqueFormBloc.add(RemoveTechniqueLocalization(this.data.languageCode));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
