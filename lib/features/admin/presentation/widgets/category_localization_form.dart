import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_multiline_text_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';

/// Form to modify or create category localization.
class CategoryLocalizationForm extends StatefulWidget {
  final CategoryFormBloc bloc;
  final CategoryLocalizedData? data;
  final void Function(CategoryLocalizedData) onSubmit;
  final String submitButtonText;

  const CategoryLocalizationForm({
    Key? key,
    required this.bloc,
    this.data,
    required this.onSubmit,
    this.submitButtonText = "Save",
  }) : super(key: key);

  @override
  _CategoryLocalizationFormState createState() => _CategoryLocalizationFormState();
}

class _CategoryLocalizationFormState extends State<CategoryLocalizationForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final DropdownButtonFormFieldController<String> _languageController = DropdownButtonFormFieldController<String>();

  @override
  void initState() {
    final preloadedData = this.widget.data;

    if (preloadedData != null) {
      _languageController.value = preloadedData.languageCode;
      _titleController.text = preloadedData.title;
      _descriptionController.text = preloadedData.description;
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
      children: [
        if (this.widget.data == null) _buildLanguagePicker(context),
        const SizedBox(height: 10),
        RoundedTextField(
          icon: Icons.title_rounded,
          placeholderText: "Title",
          controller: _titleController,
        ),
        const SizedBox(height: 10),
        RoundedMultilineTextField(
          height: 100,
          icon: Icons.description_outlined,
          placeholderText: "Description",
          controller: _descriptionController,
        ),
        const SizedBox(height: 10),
        RoundedButton(
          text: this.widget.submitButtonText,
          onPressed: () {
            final result = CategoryLocalizedData(
              languageCode: _languageController.value!,
              title: _titleController.text,
              description: _descriptionController.text,
            );

            this.widget.onSubmit(result);
          },
        ),
      ],
    );
  }
}
