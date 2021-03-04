import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

class LanguageSideScrollGrid extends StatelessWidget {
  final List<CategoryLocalizedData> data;
  final Function(CategoryLocalizedData) onTap;
  final Function onAddButtonTap;
  final bool displayAddButton;

  Widget _buildLanguageCard(CategoryLocalizedData categoryLocalizedData, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: BASE_COLOR_LIGHTER,
      child: InkWell(
        onTap: () => this.onTap(categoryLocalizedData),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: BASE_COLOR,
      child: InkWell(
        onTap: this.onAddButtonTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(height: 5),
              Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  const LanguageSideScrollGrid({
    Key key,
    @required this.data,
    @required this.onTap,
    @required this.onAddButtonTap,
    this.displayAddButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: displayAddButton ? data.length + 1 : data.length,
        itemBuilder: (ctx, index) {
          if (index == data.length)
            return _buildAddButton();
          else {
            final categoryLocalizedData = data[index];
            final languageName = SupportedLanguages.getName(categoryLocalizedData.languageCode);
            final label = localizations.translate(languageName);
            return _buildLanguageCard(categoryLocalizedData, label);
          }
        },
      ),
    );
  }
}
