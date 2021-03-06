import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

class CategoryLocalizationEditScreen extends StatefulWidget {
  final CategoryLocalizedData data;
  final Function(CategoryLocalizedData) onSave;
  final Function onRemove;

  const CategoryLocalizationEditScreen({
    Key key,
    this.data,
    this.onRemove,
    this.onSave,
  }) : super(key: key);

  @override
  _CategoryLocalizationEditScreenState createState() => _CategoryLocalizationEditScreenState();
}

class _CategoryLocalizationEditScreenState extends State<CategoryLocalizationEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
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
                placeholderText: localizations.translate("Title"),
                controller: _titleController,
              ),
              SizedBox(height: 10),
              RoundedTextField(
                icon: Icons.description_outlined,
                placeholderText: localizations.translate("Description"),
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
                      color: Colors.redAccent[200],
                      textColor: Colors.white,
                      borderColor: Colors.redAccent[200],
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
