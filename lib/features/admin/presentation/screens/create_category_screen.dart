import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';

class CreateCategoryScreen extends StatefulWidget {
  @override
  _CreateCategoryScreenState createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final _createCategoryBloc = serviceLocator<CreateCategoryBloc>();
  final _toggleSwitchBloc = serviceLocator<ToggleSwitchBloc>();

  @override
  void dispose() {
    _createCategoryBloc.close();
    _toggleSwitchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<CreateCategoryBloc>(create: (_) => this._createCategoryBloc),
              BlocProvider<ToggleSwitchBloc>(create: (_) => _toggleSwitchBloc),
            ],
            child: Column(
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
                              onChanged: (val) => _toggleSwitchBloc.add(ToggleSwitchEvent()),
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
                          displayAddButton: SupportedLanguages.languages.length != _createCategoryBloc.localizedData.length,
                          data: _createCategoryBloc.localizedData.entries
                              .map(
                                (e) => LanguageSideScrollGridItem(
                                  languageCode: e.key,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE,
                                    arguments: CategoryLocalizationEditScreenArgs(
                                      data: e.value,
                                      onSave: (localizedData) => _createCategoryBloc.add(EditCategoryLocalizationEvent(localizedData)),
                                      onRemove: () => _createCategoryBloc.add(RemoveCategoryLocalizationEvent(e.key)),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onAddButtonTap: () => Navigator.pushNamed(
                            context,
                            CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE,
                            arguments: CategoryLocalizationAddScreenArgs(createCategoryBloc: _createCategoryBloc),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Create",
                  onPressed: () => _createCategoryBloc.add(CreateCategoryFormSubmittedEvent(_toggleSwitchBloc.state is ToggleSwitchOnState)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
