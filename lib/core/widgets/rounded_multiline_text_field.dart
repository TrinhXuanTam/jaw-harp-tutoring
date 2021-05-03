import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

/// Rounded multiline text field.
class RoundedMultilineTextField extends StatefulWidget {
  final String placeholderText;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final TextEditingController controller;
  final double? height;

  const RoundedMultilineTextField({
    Key? key,
    this.placeholderText = "",
    required this.icon,
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
    required this.controller,
    this.height,
  }) : super(key: key);

  @override
  _RoundedMultilineTextFieldState createState() => _RoundedMultilineTextFieldState();
}

class _RoundedMultilineTextFieldState extends State<RoundedMultilineTextField> {
  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return RoundedInputField(
      height: this.widget.height,
      color: this.widget.color,
      child: GestureDetector(
        onTap: () => _focus.requestFocus(),
        child: Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 17),
                child: Icon(this.widget.icon, color: this.widget.iconColor),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: _focus,
                  maxLines: null,
                  controller: this.widget.controller,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: l10n.translate(this.widget.placeholderText),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
