import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_list/technique_list_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_technique_list.dart';

class TechniqueListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return BlocProvider<TechniqueListBloc>(
      create: (_) => serviceLocator<TechniqueListBloc>()..add(LoadAllTechniques()),
      child: BlocBuilder<TechniqueListBloc, TechniqueListState>(
        buildWhen: (prevState, newState) => prevState is TechniqueListLoading,
        builder: (ctx, state) {
          if (state is TechniqueListLoaded)
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: IconAppBar(
                backgroundColor: BASE_COLOR,
                iconColor: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: Colors.grey[200],
              body: CenteredStack(
                children: [
                  Positioned(
                    top: 0,
                    child: BigAppBarBackground(height: size.height * 0.2),
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Browse Techniques",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Here you can browse through techniques and manage their content",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            ScrollableTechniqueList(
                              items: state.techniques
                                  .map((technique) => ScrollableTechniqueListItem(
                                        onTap: () => Navigator.pushReplacementNamed(
                                          context,
                                          EDIT_TECHNIQUE_SCREEN_ROUTE,
                                          arguments: EditTechniqueScreenArgs(
                                            technique,
                                            (ctx) => Navigator.pushReplacementNamed(ctx, TECHNIQUE_LIST_SCREEN_ROUTE),
                                          ),
                                        ),
                                        title: technique.getLocalizedTitle(l10n.locale.languageCode),
                                        productId: technique.productId.orElseGet(() => "Free"),
                                        thumbnail: technique.thumbnail.toNullable(),
                                      ))
                                  .toList(),
                              height: size.height * 0.7,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          else
            return LoadingScreen();
        },
      ),
    );
  }
}
