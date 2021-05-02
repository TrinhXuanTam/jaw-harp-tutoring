import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_multiline_text_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';

/// Form to modify or create category localization.
class TechniqueLocalizationForm extends StatefulWidget {
  final TechniqueFormBloc bloc;
  final TechniqueLocalizedData? data;
  final void Function(TechniqueLocalizedData) onSubmit;
  final String submitButtonText;

  const TechniqueLocalizationForm({
    Key? key,
    this.data,
    required this.onSubmit,
    this.submitButtonText = "Submit",
    required this.bloc,
  }) : super(key: key);

  @override
  _TechniqueLocalizationFormState createState() => _TechniqueLocalizationFormState();
}

class _TechniqueLocalizationFormState extends State<TechniqueLocalizationForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _accompanyingTextController = TextEditingController();
  final DropdownButtonFormFieldController<String> _languageController = DropdownButtonFormFieldController<String>();

  @override
  void initState() {
    final preloadedData = this.widget.data;

    if (preloadedData != null) {
      _languageController.value = preloadedData.languageCode;
      _titleController.text = preloadedData.title;
      _descriptionController.text = preloadedData.description;
      _accompanyingTextController.text = preloadedData.accompanyingText;
    }

    super.initState();
  }

  RoundedDropdown<String> _buildLanguagePicker(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final usedLanguages = this.widget.bloc.state.localizedData;
    final availableLanguages = SupportedLanguages.languages.where((lang) => !usedLanguages.containsKey(lang.code));
    final dropdownItems = availableLanguages.map((e) => DropdownMenuItem(child: Text(l10n.translate(e.name)), value: e.code)).toList();
    _languageController.value = dropdownItems.first.value;

    return RoundedDropdown<String>(
      controller: _languageController,
      items: dropdownItems,
      placeholderText: "Choose Language",
      icon: Icons.language_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (this.widget.data == null) _buildLanguagePicker(context),
        SizedBox(height: 10),
        RoundedTextField(
          icon: Icons.title_rounded,
          placeholderText: "Title",
          controller: _titleController,
        ),
        SizedBox(height: 10),
        RoundedMultilineTextField(
          height: 100,
          icon: Icons.description_outlined,
          placeholderText: "Description",
          controller: _descriptionController,
        ),
        SizedBox(height: 10),
        RoundedMultilineTextField(
          height: 250,
          icon: Icons.library_books_outlined,
          placeholderText: "Accompanying text",
          controller: _accompanyingTextController,
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: this.widget.submitButtonText,
          onPressed: () {
            final result = TechniqueLocalizedData(
              languageCode: _languageController.value!,
              title: _titleController.text,
              description: _descriptionController.text,
              accompanyingText: _accompanyingTextController.text,
            );

            this.widget.onSubmit(result);
          },
        ),
      ],
    );
  }
}
