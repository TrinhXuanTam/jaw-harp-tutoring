import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_multiline_text_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class TechniqueLocalizationAddScreenArgs {
  final CreateTechniqueBloc createTechniqueBloc;

  TechniqueLocalizationAddScreenArgs(this.createTechniqueBloc);
}

class TechniqueLocalizationAddScreen extends StatefulWidget {
  final CreateTechniqueBloc createTechniqueBloc;

  factory TechniqueLocalizationAddScreen.fromArgs(TechniqueLocalizationAddScreenArgs args) {
    return TechniqueLocalizationAddScreen(createTechniqueBloc: args.createTechniqueBloc);
  }

  const TechniqueLocalizationAddScreen({
    Key? key,
    required this.createTechniqueBloc,
  }) : super(key: key);

  @override
  _TechniqueLocalizationAddScreenState createState() => _TechniqueLocalizationAddScreenState();
}

class _TechniqueLocalizationAddScreenState extends State<TechniqueLocalizationAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _accompanyingTextController = TextEditingController();
  final DropdownButtonFormFieldController<String> _languageController = DropdownButtonFormFieldController<String>();

  List<DropdownMenuItem<String>> _createDropdownMenuItems(AppLocalizations l10n) {
    return SupportedLanguages.languages
        .where(
          (element) => !widget.createTechniqueBloc.localizedData.containsKey(element.code),
        )
        .map(
          (e) => DropdownMenuItem(
            child: Text(l10n.translate(e.name)),
            value: e.code,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dropdownItems = _createDropdownMenuItems(l10n);
    if (dropdownItems.isNotEmpty) _languageController.value = dropdownItems.first.value;

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
                    titleText: "Add Localization",
                    titleSize: 30,
                    subtitleText: "Add localized data to your technique",
                  ),
                  SizedBox(height: 20),
                  RoundedDropdown<String>(
                    controller: _languageController,
                    items: dropdownItems,
                    placeholderText: "Choose Language",
                    icon: Icons.language_rounded,
                  ),
                  SizedBox(height: 10),
                  RoundedTextField(
                    icon: Icons.title_rounded,
                    placeholderText: l10n.translate("Title"),
                    controller: _titleController,
                  ),
                  SizedBox(height: 10),
                  RoundedMultilineTextField(
                    height: 100,
                    icon: Icons.description_outlined,
                    placeholderText: l10n.translate("Description"),
                    controller: _descriptionController,
                  ),
                  SizedBox(height: 10),
                  RoundedMultilineTextField(
                    height: 250,
                    icon: Icons.library_books_outlined,
                    placeholderText: l10n.translate("Accompanying text"),
                    controller: _accompanyingTextController,
                  ),
                  SizedBox(height: 10),
                  RoundedButton(
                    text: "Add",
                    onPressed: () {
                      widget.createTechniqueBloc.add(
                        AddTechniqueLocalizationEvent(
                          TechniqueLocalizedData(
                            languageCode: _languageController.value!,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            accompanyingText: _accompanyingTextController.text,
                          ),
                        ),
                      );
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
