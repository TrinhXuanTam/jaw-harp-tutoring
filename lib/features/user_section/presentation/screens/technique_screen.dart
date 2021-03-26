import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_player_widget.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueScreenArgs {
  final Technique technique;

  TechniqueScreenArgs(this.technique);
}

class TechniqueScreen extends StatelessWidget {
  final Technique technique;

  factory TechniqueScreen.fromArgs(TechniqueScreenArgs args) => TechniqueScreen(technique: args.technique);

  const TechniqueScreen({
    Key? key,
    required this.technique,
  }) : super(key: key);

  Widget _buildHeader(BuildContext context, TechniqueDetailLoaded state) {
    if (state.videoPlayerController.isPresent)
      return VideoPlayerWidget(
        controller: state.videoPlayerController.value,
        fullscreen: false,
      );
    else {
      final size = MediaQuery.of(context).size;

      if (state.technique.thumbnail.isPresent) {
        return ClipRect(
          child: Container(
            height: size.height * 0.3,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: getImageFromMedia(state.technique.thumbnail.value),
            ),
          ),
        );
      } else
        return Container(
          height: size.height * 0.3,
          width: double.infinity,
          color: BASE_COLOR,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(LOGO_LOCATION),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        _buildHeader(context, state),
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
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        Text(
                                          "Favorite",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 25),
                                    Column(
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
                                  ],
                                ),
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
                                              BlocProvider<TechniquesBloc>(
                                                create: (_) => serviceLocator<TechniquesBloc>()..add(LoadTechniquesByCategory(this.technique.category)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10),
                                                  child: BlocBuilder<TechniquesBloc, TechniquesState>(
                                                    builder: (ctx, state) {
                                                      if (state is TechniquesLoaded)
                                                        return SmallTechniqueList(techniques: state.techniques);
                                                      else
                                                        return SmallTechniqueList(isLoading: true);
                                                    },
                                                  ),
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
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
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
