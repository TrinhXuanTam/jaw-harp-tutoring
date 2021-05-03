import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';

/// Localization side scroll menu to add localized content.
class LocalizationField extends StatelessWidget {
  final String title;
  final String description;
  final bool displayAddButton;
  final VoidCallback onAddButtonTap;
  final List<LanguageSideScrollGridItem> data;

  const LocalizationField({
    Key? key,
    this.title = "Localization:",
    this.description = "Translate your content into different languages.",
    required this.displayAddButton,
    required this.onAddButtonTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.translate(this.title),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(
          l10n.translate(this.description),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 5),
        LanguageSideScrollGrid(
          displayAddButton: this.displayAddButton,
          data: this.data,
          onAddButtonTap: this.onAddButtonTap,
        ),
      ],
    );
  }
}
