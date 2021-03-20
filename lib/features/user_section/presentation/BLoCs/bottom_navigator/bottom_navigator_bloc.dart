import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/presentation/screens/admin_menu_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/home_page.dart';
import 'package:meta/meta.dart';

part 'bottom_navigator_event.dart';
part 'bottom_navigator_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class BottomNavigatorBloc extends Bloc<BottomNavigatorEvent, BottomNavigatorState> {
  BottomNavigatorBloc() : super(HomePageChosen(0));

  @override
  Stream<BottomNavigatorState> mapEventToState(
    BottomNavigatorEvent event,
  ) async* {
    if (event is NavigationItemClicked)
      switch (event.index) {
        case 0:
          yield HomePageChosen(state.index);
          break;
        case 1:
          yield DownloadsChosen(state.index);
          break;
        case 2:
          yield FavoritesChosen(state.index);
          break;
        default:
          yield ProfileSectionChosen(state.index);
          break;
      }
  }
}
