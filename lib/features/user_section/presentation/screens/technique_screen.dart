import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_detail/technique_detail_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_player_widget.dart';

class TechniqueScreen extends StatelessWidget {
  final Technique technique;

  const TechniqueScreen({
    Key? key,
    required this.technique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniqueDetailBloc>(
      create: (_) => serviceLocator<TechniqueDetailBloc>()..add(LoadTechniqueDetail(this.technique)),
      child: BlocBuilder<TechniqueDetailBloc, TechniqueDetailState>(
        builder: (ctx, state) {
          if (state is TechniqueDetailLoaded) {
            return Scaffold(
              appBar: IconAppBar(
                iconColor: Colors.white,
                backgroundColor: BASE_COLOR,
                onPressed: () => Navigator.pop(context),
              ),
              body: CenteredStack(
                children: [
                  Column(
                    children: [
                      if (state.videoPlayerController.isPresent) VideoPlayerWidget(controller: state.videoPlayerController.value),
                    ],
                  ),
                ],
              ),
            );
          } else
            return LoadingScreen();
        },
      ),
    );
  }
}
