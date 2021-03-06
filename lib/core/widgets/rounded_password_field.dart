import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/hide_field_input/hide_field_input_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final String placeholderText;
  final Color color;
  final Color iconColor;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key,
    this.placeholderText = "",
    this.color = BASE_COLOR_VERY_LIGHT,
    this.iconColor = BASE_COLOR,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HideFieldInputBloc>(
      create: (_) => serviceLocator<HideFieldInputBloc>(),
      child: RoundedInputField(
        color: this.color,
        child: BlocBuilder<HideFieldInputBloc, HideFieldInputState>(
          builder: (ctx, state) {
            return TextField(
              controller: this.controller,
              obscureText: state is InputHiddenState,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 16),
                icon: Icon(
                  Icons.lock,
                  color: this.iconColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    state is InputHiddenState ? Icons.visibility_off : Icons.visibility,
                    color: this.iconColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<HideFieldInputBloc>(ctx).add(
                      ToggleVisibilityEvent(),
                    );
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
