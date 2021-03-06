import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

class CategoryLocalizationAddScreen extends StatefulWidget {
  final CreateCategoryBloc createCategoryBloc;

  const CategoryLocalizationAddScreen({
    Key key,
    @required this.createCategoryBloc,
  }) : super(key: key);

  @override
  _CategoryLocalizationAddScreenState createState() => _CategoryLocalizationAddScreenState();
}

class _CategoryLocalizationAddScreenState extends State<CategoryLocalizationAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final DropdownButtonFormFieldController<String> _languageController = DropdownButtonFormFieldController<String>();

  List<DropdownMenuItem> _createDropdownMenuItems(AppLocalizations localizations) {
    return SupportedLanguages.languages
        .where(
          (element) => !widget.createCategoryBloc.localizedData.containsKey(element.code),
        )
        .map(
          (e) => DropdownMenuItem(
            child: Text(localizations.translate(e.name)),
            value: e.code,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final dropdownItems = _createDropdownMenuItems(localizations);
    if (dropdownItems.isNotEmpty) _languageController.value = dropdownItems.first.value;

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
                titleText: "Add Localization",
                titleSize: 30,
                subtitleText: "Add localized data to your category",
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
                text: "Add",
                onPressed: () {
                  widget.createCategoryBloc.add(
                    AddCategoryLocalizationEvent(
                      CategoryLocalizedData(
                        _languageController.value,
                        _titleController.text,
                        _descriptionController.text,
                      ),
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
