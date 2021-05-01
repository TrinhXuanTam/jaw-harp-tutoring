import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/unlock_technique_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_player_widget.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueScreenArgs {
  final Technique technique;
  final bool hasAccess;

  TechniqueScreenArgs(this.technique, this.hasAccess);
}

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

  Widget _buildFavoriteButton(BuildContext context) {
    final user = getUser(context);
    final isFavorite = user.favoriteTechniques.contains(this.technique.id);

    return GestureDetector(
      onTap: () {
        final techniqueDetailBloc = BlocProvider.of<TechniqueDetailBloc>(context);
        final user = getUser(context);

        if (isFavorite)
          techniqueDetailBloc.add(RemoveTechniqueFromFavoritesEvent(technique, user));
        else
          techniqueDetailBloc.add(MarkTechniqueAsFavoriteEvent(technique, user));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Icon(
                isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isFavorite ? BASE_COLOR : Colors.grey,
                size: 20,
              ),
              Text(
                "Favorite",
                style: TextStyle(
                  fontSize: 12,
                  color: isFavorite ? BASE_COLOR : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: 25),
          _buildDownloadButton(context),
        ],
      ),
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return BlocBuilder<TechniqueLocalStorageBloc, TechniqueLocalStorageState>(builder: (ctx, state) {
      if (state.downloadingInProgress.contains(this.technique.id))
        return Column(
          children: [
            Icon(
              Icons.download_rounded,
              color: Colors.grey,
              size: 20,
            ),
            Text(
              "Downloading...",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        );
      else if (!state.downloadedTechniques.containsKey(technique.id))
        return GestureDetector(
          onTap: () => BlocProvider.of<TechniqueLocalStorageBloc>(ctx).add(DownloadTechniqueEvent(this.technique.id)),
          child: Column(
            children: [
              Icon(
                Icons.download_outlined,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                "Download",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      else
        return GestureDetector(
          onTap: () => BlocProvider.of<TechniqueLocalStorageBloc>(ctx).add(DeleteDownloadedTechniqueEvent(this.technique.id)),
          child: Column(
            children: [
              Icon(
                Icons.delete_forever_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              Text(
                "Delete",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
    });
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
                                _buildFavoriteButton(ctx),
                                DefaultTabController(
                                  length: 2,
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
                                          child: TabBar(
                                            isScrollable: true,
                                            unselectedLabelColor: Colors.grey,
                                            labelColor: Colors.black,
                                            tabs: [
                                              Tab(text: "Text"),
                                              Tab(text: "More"),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Scrollbar(
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Difficulty",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(technique.difficulty.string),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          "Description",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                        Text(technique.description),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          "Detail",
                                                          style: TextStyle(
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
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: SmallTechniqueList(techniquesIds: this.technique.category.techniqueIds),
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
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
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
            return LoadingScreen();
        },
      ),
    );
  }
}
