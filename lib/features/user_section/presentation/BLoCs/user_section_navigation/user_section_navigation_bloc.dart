import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/presentation/screens/admin_menu_screen.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/screens/user_section.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/categories_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/home_page_body.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:meta/meta.dart';

part 'user_section_navigation_event.dart';
part 'user_section_navigation_state.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class UserSectionNavigationBloc extends Bloc<UserSectionNavigationEvent, UserSectionNavigationState> {
  UserSectionNavigationBloc() : super(HomePage(false));

  @override
  Stream<UserSectionNavigationState> mapEventToState(
    UserSectionNavigationEvent event,
  ) async* {
    if (event is NavigateToHomePage)
      yield HomePage(state.bottomNavigatorIndex > HOME_INDEX);
    else if (event is NavigateToDownloads)
      yield DownloadsPage(state.bottomNavigatorIndex > DOWNLOADS_INDEX);
    else if (event is NavigateToFavorites)
      yield FavoritesPage(state.bottomNavigatorIndex > FAVORITES_INDEX);
    else if (event is NavigateToProfileSection)
      yield ProfileSectionPage(state.bottomNavigatorIndex > PROFILE_SECTION_INDEX);
    else if (event is NavigateCategoriesPage) yield CategoriesPage(event.categories);
  }
}
