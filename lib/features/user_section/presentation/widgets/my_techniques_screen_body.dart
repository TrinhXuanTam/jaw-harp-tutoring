import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/no_internet_widget.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/downloaded_techniques_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/tab_menu.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// User content screen.
class MyTechniquesScreenBody extends StatelessWidget {
  const MyTechniquesScreenBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = getUser(context);

    return Container(
      color: Colors.white,
      child: TabMenu(
        items: [
          TabMenuItem(
            title: l10n.translate("My Techniques"),
            body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, state) {
                if (state is NoInternetConnection) return const NoInternetWidget();
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TechniqueList(
                    techniqueIds: user.purchasedTechniques.toList(),
                    showFavoriteIcon: true,
                  ),
                );
              },
            ),
          ),
          TabMenuItem(
            title: l10n.translate("Downloaded"),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: DownloadedTechniquesList(),
            ),
          ),
          TabMenuItem(
            title: l10n.translate("Favorites"),
            body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
              builder: (context, state) {
                if (state is NoInternetConnection) return const NoInternetWidget();
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: TechniqueList(techniqueIds: user.favoriteTechniques.toList()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
