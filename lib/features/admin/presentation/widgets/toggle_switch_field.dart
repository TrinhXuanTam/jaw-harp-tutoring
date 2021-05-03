import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

/// Toggle switch button with title and description.
class ToggleSwitchField extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final void Function(bool value) onChanged;

  const ToggleSwitchField({
    Key? key,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.translate(this.title),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                l10n.translate(this.description),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Switch(
          value: this.value,
          activeColor: BASE_COLOR,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
