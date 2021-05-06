import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class LanguageSideScrollGridItem {
  final String languageCode;
  final VoidCallback onTap;

  LanguageSideScrollGridItem({
    required this.languageCode,
    required this.onTap,
  });
}

/// Side scroll panel for adding localization data.
class LanguageSideScrollGrid<T> extends StatelessWidget {
  final List<LanguageSideScrollGridItem> data;
  final VoidCallback onAddButtonTap;
  final bool displayAddButton;

  Widget _buildLanguageCard(LanguageSideScrollGridItem item, String label) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: BASE_COLOR_LIGHTER,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.translate_rounded,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
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

  Widget _buildAddButton(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              const SizedBox(height: 5),
              Text(
                l10n.translate("Add"),
                style: const TextStyle(
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
    Key? key,
    required this.data,
    required this.onAddButtonTap,
    this.displayAddButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      height: 100,
      child: Scrollbar(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: displayAddButton ? data.length + 1 : data.length,
          itemBuilder: (ctx, index) {
            if (index == data.length)
              return _buildAddButton(context);
            else {
              final item = data[index];
              final languageName = SupportedLanguages.getName(item.languageCode);
              final label = l10n.translate(languageName);
              return _buildLanguageCard(item, label);
            }
          },
        ),
      ),
    );
  }
}
