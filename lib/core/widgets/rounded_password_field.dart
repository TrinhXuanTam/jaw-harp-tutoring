import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart';
import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final String placeholderText;
  final Color color;
  final Color iconColor;

  const RoundedPasswordField({
    Key key,
    this.placeholderText = "",
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedInputField(
      color: this.color,
      child: BlocProvider(
        create: (_) => HideFieldInputBloc(),
        child: BlocBuilder<HideFieldInputBloc, HideFieldInputState>(
          builder: (ctx, state) {
            return TextField(
              obscureText: state is InputHiddenState,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock,
                  color: this.iconColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: this.iconColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<HideFieldInputBloc>(ctx)
                        .add(ToggleVisibilityEvent());
                  },
                ),
                hintText: this.placeholderText,
                border: InputBorder.none,
              ),
            );
          },
        ),
      ),
    );
  }
}
