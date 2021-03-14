import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_form.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithSubtitle(
                titleText: "Create Technique",
                titleSize: 35,
                subtitleText: "Create a new technique",
              ),
              SizedBox(height: 20),
              BlocProvider<TechniqueFormBloc>(
                create: (ctx) => serviceLocator<TechniqueFormBloc>(),
                child: _CreateTechniqueForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateTechniqueForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TechniqueForm(
      submitButtonText: "Create",
      onSubmit: () => BlocProvider.of<TechniqueFormBloc>(context).add(CreateTechniqueEvent()),
      onSuccess: (technique) => Navigator.pop(context),
    );
  }
}
