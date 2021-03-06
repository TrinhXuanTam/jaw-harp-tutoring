import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

class RoundedDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final String placeholderText;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final DropdownButtonFormFieldController<T> controller;

  const RoundedDropdown({
    Key? key,
    required this.items,
    required this.placeholderText,
    required this.icon,
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return RoundedInputField(
      color: this.color,
      child: DropdownButtonFormField<T>(
        value: controller.value,
        icon: Icon(
          Icons.arrow_drop_down,
          color: this.iconColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            this.icon,
            color: this.iconColor,
          ),
        ),
        hint: Text(l10n.translate(this.placeholderText)),
        onChanged: (value) => controller.value = value,
        items: items,
      ),
    );
  }
}

class DropdownButtonFormFieldController<T> {
  T? value;

  DropdownButtonFormFieldController({this.value});
}
