import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';

class LazyLoadTechniquesWrapper extends StatelessWidget {
  final Color color;
  final Widget child;
  final Widget Function(TechniquesBloc bloc) openBuilder;
  final TechniquesEvent loadEvent;

  const LazyLoadTechniquesWrapper({
    Key? key,
    required this.color,
    required this.openBuilder,
    required this.loadEvent,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniquesBloc>(
      create: (_) => serviceLocator<TechniquesBloc>(),
      child: _Child(
        color: color,
        openBuilder: openBuilder,
        loadEvent: loadEvent,
        child: child,
      ),
    );
  }
}

class _Child extends StatelessWidget {
  final Color color;
  final Widget child;
  final Widget Function(TechniquesBloc bloc) openBuilder;
  final TechniquesEvent loadEvent;

  const _Child({
    Key? key,
    required this.color,
    required this.openBuilder,
    required this.loadEvent,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      openColor: color,
      middleColor: color,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (ctx, _) => openBuilder(BlocProvider.of<TechniquesBloc>(context)),
      closedBuilder: (ctx, openContainer) {
        return GestureDetector(
          onTap: () {
            final techniquesBloc = BlocProvider.of<TechniquesBloc>(context);
            if (techniquesBloc.state is TechniquesLoading) techniquesBloc.add(loadEvent);
            openContainer();
          },
          child: child,
        );
      },
    );
  }
}
