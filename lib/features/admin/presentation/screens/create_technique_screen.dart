import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/create_technique_form.dart';

class CreateTechniqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<CreateTechniqueBloc>(create: (_) => serviceLocator<CreateTechniqueBloc>()),
              BlocProvider<ToggleSwitchBloc>(create: (_) => serviceLocator<ToggleSwitchBloc>()),
            ],
            child: CreateTechniqueForm(),
          ),
        ],
      ),
    );
  }
}
