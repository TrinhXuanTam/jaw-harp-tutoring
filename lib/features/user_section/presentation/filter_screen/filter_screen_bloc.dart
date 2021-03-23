import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:meta/meta.dart';

part 'filter_screen_event.dart';

part 'filter_screen_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class FilterScreenBloc extends Bloc<FilterScreenEvent, FilterScreenState> {
  FilterScreenBloc() : super(FilterScreenState());

  @override
  Stream<FilterScreenState> mapEventToState(
    FilterScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
