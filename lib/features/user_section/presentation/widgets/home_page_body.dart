import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/no_internet_widget.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_side_scroll.dart';
import 'package:jews_harp/features/user_section/utils.dart';

import 'category_side_scroll.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        "Hello, " + getUser(context).name + "!",
                        style: TextStyle(fontWeight: FontWeight.bold, color: BASE_COLOR, fontSize: 17),
                      ),
                      Text(
                        "Are you ready to learn new techniques?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      SizedBox(height: 20),
                      CategorySideScroll(),
                      SizedBox(height: 15),
                      BlocBuilder<MostRecentTechniquesBloc, MostRecentTechniquesState>(
                        builder: (ctx, state) {
                          if (state is MostRecentTechniquesLoaded)
                            return TechniqueSideScroll.fromTechniques(state.techniques, title: "What's new?");
                          else
                            return TechniqueSideScrollLoading();
                        },
                      ),
                      if (user.favoriteTechniques.isNotEmpty)
                        TechniqueSideScroll(
                          techniqueIds: user.favoriteTechniques.toList(),
                          title: "Your favorites",
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
