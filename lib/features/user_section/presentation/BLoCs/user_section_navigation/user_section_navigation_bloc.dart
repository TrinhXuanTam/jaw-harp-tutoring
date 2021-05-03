import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/presentation/screens/user_section.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/home_page_body.dart';
import 'package:meta/meta.dart';

part 'user_section_navigation_event.dart';

part 'user_section_navigation_state.dart';

/// User section navigation state management.
@Injectable(env: [Environment.prod, Environment.dev])
class UserSectionNavigationBloc extends Bloc<UserSectionNavigationEvent, UserSectionNavigationState> {
  UserSectionNavigationBloc() : super(UserSectionNavigationState(body: HomePageBody(), bottomNavigatorIndex: HOME_INDEX));

  @override
  Stream<UserSectionNavigationState> mapEventToState(UserSectionNavigationEvent event) async* {
    if (event is UserSectionNavigationEvent)
      yield UserSectionNavigationState(
        body: event.body,
        bottomNavigatorIndex: event.bottomNavigatorIndex,
        reversedTransition: state.bottomNavigatorIndex > event.bottomNavigatorIndex,
      );
  }
}
