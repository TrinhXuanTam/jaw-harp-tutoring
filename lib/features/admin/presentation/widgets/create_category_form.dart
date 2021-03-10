import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';

import 'language_side_scroll_grid.dart';

class CreateCategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final createCategoryBloc = BlocProvider.of<CreateCategoryBloc>(context);
    // ignore: close_sinks
    final toggleSwitchBloc = BlocProvider.of<ToggleSwitchBloc>(context);
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleWithSubtitle(
          titleText: "Create Category",
          titleSize: 35,
          subtitleText: "Create a new category to group techniques",
        ),
        SizedBox(height: 20),
        Container(
          width: size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visibility:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "The category and its content will be visible to the public if set.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
                  BlocBuilder<ToggleSwitchBloc, ToggleSwitchState>(
                    builder: (ctx, state) => Switch(
                      value: state is ToggleSwitchOnState,
                      activeColor: BASE_COLOR,
                      onChanged: (val) => toggleSwitchBloc.add(ToggleSwitchEvent()),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Localization:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Translate your content into different languages.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
                listener: (ctx, state) {
                  if (state is CreateCategoryNotFinishedState) Navigator.popUntil(context, ModalRoute.withName(CREATE_CATEGORY_SCREEN_ROUTE));
                  if (state is CreateCategoryFinishedState) Navigator.pop(context);
                },
                builder: (ctx, _) => LanguageSideScrollGrid(
                  displayAddButton: SupportedLanguages.languages.length != createCategoryBloc.localizedData.length,
                  data: createCategoryBloc.languageSideScrollGridItems(ctx),
                  onAddButtonTap: () => Navigator.pushNamed(
                    context,
                    CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE,
                    arguments: CategoryLocalizationAddScreenArgs(createCategoryBloc: createCategoryBloc),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: "Create",
          onPressed: () => createCategoryBloc.add(CreateCategoryFormSubmittedEvent(toggleSwitchBloc.state is ToggleSwitchOnState)),
        ),
      ],
    );
  }
}
