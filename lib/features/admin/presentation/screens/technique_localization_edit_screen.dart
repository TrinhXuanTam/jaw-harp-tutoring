import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_multiline_text_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class TechniqueLocalizationEditScreenArgs {
  final TechniqueLocalizedData data;
  final void Function(TechniqueLocalizedData) onSave;
  final VoidCallback onRemove;

  TechniqueLocalizationEditScreenArgs({
    required this.data,
    required this.onSave,
    required this.onRemove,
  });
}

class TechniqueLocalizationEditScreen extends StatefulWidget {
  final TechniqueLocalizedData data;
  final void Function(TechniqueLocalizedData) onSave;
  final VoidCallback onRemove;

  factory TechniqueLocalizationEditScreen.fromArgs(TechniqueLocalizationEditScreenArgs args) {
    return TechniqueLocalizationEditScreen(
      data: args.data,
      onSave: args.onSave,
      onRemove: args.onRemove,
    );
  }

  const TechniqueLocalizationEditScreen({
    Key? key,
    required this.data,
    required this.onRemove,
    required this.onSave,
  }) : super(key: key);

  @override
  _TechniqueLocalizationEditScreenState createState() => _TechniqueLocalizationEditScreenState();
}

class _TechniqueLocalizationEditScreenState extends State<TechniqueLocalizationEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _accompanyingTextController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.data.title;
    _descriptionController.text = widget.data.description;
    _accompanyingTextController.text = widget.data.accompanyingText;
    super.initState();
  }

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
                    subtitleText: "Edit localized data for " + SupportedLanguages.getName(this.widget.data.languageCode).toLowerCase(),
                  ),
                  SizedBox(height: 20),
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
                    text: "Save",
                    onPressed: () => widget.onSave(
                      TechniqueLocalizedData(
                        widget.data.languageCode,
                        _titleController.text,
                        _descriptionController.text,
                        _accompanyingTextController.text,
                      ),
                    ),
                  ),
                  if (widget.data.languageCode != "en")
                    Column(
                      children: [
                        SizedBox(height: 5),
                        RoundedButton(
                          text: "Remove",
                          color: Colors.redAccent[200]!,
                          textColor: Colors.white,
                          borderColor: Colors.redAccent[200]!,
                          onPressed: widget.onRemove,
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