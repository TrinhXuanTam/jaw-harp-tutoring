import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/filter_screen/filter_screen_bloc.dart';

class FilterScreenArgs {
  final TechniquesBloc techniquesBloc;

  FilterScreenArgs(this.techniquesBloc);
}

class FilterScreen extends StatelessWidget {
  final TechniquesBloc techniquesBloc;

  factory FilterScreen.fromArgs(FilterScreenArgs args) => FilterScreen(techniquesBloc: args.techniquesBloc);

  const FilterScreen({Key? key, required this.techniquesBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterScreenBloc>(
      create: (_) => serviceLocator<FilterScreenBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: IconAppBar(
          title: "Search",
          titleColor: Colors.white,
          backgroundColor: BASE_COLOR,
          icon: Icons.close_rounded,
          iconColor: Colors.white,
          onPressed: () => Navigator.pop(context),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  "Reset",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
        body: CenteredStack(
          children: [
            _Form(),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FilterScreenBloc>(context).state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedTextField(
                icon: Icons.search,
                controller: state.searchController,
                placeholderText: "Keywords",
              ),
              SizedBox(height: 10),
              RoundedDropdown(items: [], placeholderText: "Order by", icon: Icons.sort_rounded, controller: state.orderController),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: RoundedButton(text: "Apply", onPressed: () {}),
        ),
      ],
    );
  }
}
