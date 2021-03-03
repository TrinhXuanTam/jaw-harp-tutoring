import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/techniques/domain/entitites/category_localized_data.dart';

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
                      LanguageSideScrollGrid(
                        data: [
                          CategoryLocalizedData("cs"),
                          CategoryLocalizedData("en"),
                        ],
                        onTap: (localizedData) => print(localizedData.languageCode),
                        onAddButtonTap: () => print("tapped"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(text: "Create", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
