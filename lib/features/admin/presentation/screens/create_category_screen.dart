import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_category/create_category_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/create_category_form.dart';

class CreateCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider<CreateCategoryBloc>(create: (_) => serviceLocator<CreateCategoryBloc>()),
              BlocProvider<ToggleSwitchBloc>(create: (_) => serviceLocator<ToggleSwitchBloc>()),
            ],
            child: CreateCategoryForm(),
          ),
        ],
      ),
    );
  }
}
