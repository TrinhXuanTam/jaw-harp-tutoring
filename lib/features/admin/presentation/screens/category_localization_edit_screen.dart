import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

class CategoryLocalizationEditScreenArgs {
  final CategoryLocalizedData data;
  final void Function(CategoryLocalizedData) onSave;
  final VoidCallback onRemove;

  CategoryLocalizationEditScreenArgs({
    required this.data,
    required this.onSave,
    required this.onRemove,
  });
}

class CategoryLocalizationEditScreen extends StatefulWidget {
  final CategoryLocalizedData data;
  final void Function(CategoryLocalizedData) onSave;
  final VoidCallback onRemove;

  factory CategoryLocalizationEditScreen.fromArgs(CategoryLocalizationEditScreenArgs args) {
    return CategoryLocalizationEditScreen(
      data: args.data,
      onSave: args.onSave,
      onRemove: args.onRemove,
    );
  }

  const CategoryLocalizationEditScreen({
    Key? key,
    required this.data,
    required this.onRemove,
    required this.onSave,
  }) : super(key: key);

  @override
  _CategoryLocalizationEditScreenState createState() => _CategoryLocalizationEditScreenState();
}

class _CategoryLocalizationEditScreenState extends State<CategoryLocalizationEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    _titleController.text = widget.data.title;
    _descriptionController.text = widget.data.description;

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
              RoundedTextField(
                icon: Icons.description_outlined,
                placeholderText: l10n.translate("Description"),
                controller: _descriptionController,
              ),
              SizedBox(height: 10),
              RoundedButton(
                text: "Save",
                onPressed: () => widget.onSave(CategoryLocalizedData(widget.data.languageCode, _titleController.text, _descriptionController.text)),
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
    );
  }
}
