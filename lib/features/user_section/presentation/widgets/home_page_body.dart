import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/no_internet_widget.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_side_scroll.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_side_scroll.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// Home page were technique lists are displayed.
class HomePageBody extends StatelessWidget {
  const HomePageBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = getUser(context);

    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (ctx, state) {
        if (state is NoInternetConnection) return NoInternetWidget();

        return CenteredStack(
          children: [
            Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.translate("Hello") + ", " + getUser(context).name + "!",
                        style: const TextStyle(fontWeight: FontWeight.bold, color: BASE_COLOR, fontSize: 17),
                      ),
                      Text(
                        l10n.translate("Are you ready to learn new techniques?"),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                      const SizedBox(height: 20),
                      const CategorySideScroll(),
                      const SizedBox(height: 15),
                      BlocBuilder<MostRecentTechniquesBloc, MostRecentTechniquesState>(
                        builder: (ctx, state) {
                          if (state is MostRecentTechniquesLoaded)
                            return TechniqueSideScroll.fromTechniques(state.techniques, title: l10n.translate("What's new?"));
                          else
                            return const TechniqueSideScrollLoading();
                        },
                      ),
                      if (user.favoriteTechniques.isNotEmpty)
                        TechniqueSideScroll(
                          techniqueIds: user.favoriteTechniques.toList(),
                          title: l10n.translate("Your favorites"),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
