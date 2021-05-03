import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/no_internet_widget.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/unlock_technique_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/tab_menu.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_download_button.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_favorite_button.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_player_widget.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueScreenArgs {
  final Technique technique;
  final bool hasAccess;

  TechniqueScreenArgs(this.technique, this.hasAccess);
}

/// Technique detail screen.
class TechniqueScreen extends StatelessWidget {
  final Technique technique;
  final bool hasAccess;

  factory TechniqueScreen.fromArgs(TechniqueScreenArgs args) {
    return TechniqueScreen(
      technique: args.technique,
      hasAccess: args.hasAccess,
    );
  }

  const TechniqueScreen({
    Key? key,
    required this.technique,
    required this.hasAccess,
  }) : super(key: key);

  Widget _buildHeader(BuildContext context, TechniqueDetailLoaded state) {
    if (state.videoPlayerController.isPresent)
      return VideoPlayerWidget(
        controller: state.videoPlayerController.value,
        fullscreen: false,
      );
    else {
      final size = MediaQuery.of(context).size;

      return ClipRect(
        child: Container(
          height: size.height * 0.3,
          width: double.infinity,
          child: getTechniqueThumbnail(state.technique),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // User has no access to this technique.
    if (!hasAccess) return UnlockTechniqueScreen(technique: technique);

    return BlocProvider<TechniqueDetailBloc>(
      create: (_) => serviceLocator<TechniqueDetailBloc>()..add(LoadTechniqueDetail(this.technique)),
      child: BlocBuilder<TechniqueDetailBloc, TechniqueDetailState>(
        builder: (ctx, state) {
          if (state is TechniqueDetailLoaded) {
            final l10n = AppLocalizations.of(ctx);

            return SafeArea(
              child: Scaffold(
                body: CenteredStack(
                  children: [
                    Column(
                      children: [
                        _buildHeader(ctx, state),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  technique.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  technique.category.title,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (BlocProvider.of<ConnectivityBloc>(ctx).state is ConnectionAvailable)
                                      Row(
                                        children: [
                                          TechniqueFavoriteButton(technique: this.technique),
                                          const SizedBox(width: 25),
                                        ],
                                      ),
                                    TechniqueDownloadButton(technique: this.technique),
                                  ],
                                ),
                                Expanded(
                                  child: TabMenu(
                                    isScrollable: true,
                                    items: [
                                      TabMenuItem(
                                        title: l10n.translate("Text"),
                                        body: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Scrollbar(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    l10n.translate("Difficulty"),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(technique.difficulty.string),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    l10n.translate("Description"),
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(technique.description),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    l10n.translate("Detail"),
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(technique.accompanyingText),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TabMenuItem(
                                        title: l10n.translate("More"),
                                        body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
                                          builder: (context, state) {
                                            if (state is NoInternetConnection) return NoInternetWidget();
                                            return Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: SmallTechniqueList(techniquesIds: this.technique.category.techniqueIds),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          state.videoPlayerController.ifPresent((controller) => controller.pause());
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else
            return const LoadingScreen();
        },
      ),
    );
  }
}
