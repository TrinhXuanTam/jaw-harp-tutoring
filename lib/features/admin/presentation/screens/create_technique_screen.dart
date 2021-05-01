import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/technique_form.dart';

class CreateTechniqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniqueFormBloc>(
      create: (context) => serviceLocator<TechniqueFormBloc>(),
      child: BlocConsumer<TechniqueFormBloc, TechniqueFormState>(
        listener: (ctx, state) {
          if (state.success != null) Navigator.pop(ctx);
        },
        builder: (ctx, state) {
          if (state.formSubmitted) return LoadingScreen(showCloseButton: false);

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
                    TechniqueForm(
                      submitButtonText: "Create",
                      onSubmit: () => BlocProvider.of<TechniqueFormBloc>(ctx).add(CreateTechniqueEvent()),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
