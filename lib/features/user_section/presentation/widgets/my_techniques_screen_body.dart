import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';

class MyTechniquesScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniqueLocalStorageBloc>(
      create: (_) => serviceLocator<TechniqueLocalStorageBloc>(),
      child: CenteredStack(
        children: [
          DefaultTabController(
            length: 3,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: "My Techniques"),
                        Tab(text: "Downloaded"),
                        Tab(text: "Favorites"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Container(),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: BlocBuilder<TechniqueLocalStorageBloc, TechniqueLocalStorageState>(
                            builder: (ctx, state) => TechniqueList(
                              techniques: state.downloadedTechniques.entries.map((e) => e.value).toList(),
                              showCategory: true,
                            ),
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
