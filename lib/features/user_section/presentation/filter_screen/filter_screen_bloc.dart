import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:meta/meta.dart';

part 'filter_screen_event.dart';
part 'filter_screen_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class FilterScreenBloc extends Bloc<FilterScreenEvent, FilterScreenState> {
  FilterScreenBloc() : super(FilterScreenState(TextEditingController(), DropdownButtonFormFieldController()));

  @override
  Stream<FilterScreenState> mapEventToState(
    FilterScreenEvent event,
  ) async* {
    if (event is LoadFilter) {
      state.searchController.text = event.searchKeywords;
      state.orderController.value = event.techniqueOrder;
      yield state.copy();
    } else if (event is ResetFilter) {
      state.searchController.text = "";
      state.orderController.value = TechniqueOrder.defaultOrder;
      yield state.copy();
    }
  }
}
