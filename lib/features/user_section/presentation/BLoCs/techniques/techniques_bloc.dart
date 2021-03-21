import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/get_techniques.dart';
import 'package:jews_harp/features/user_section/application/get_techniques_by_category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'techniques_event.dart';
part 'techniques_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class TechniquesBloc extends Bloc<TechniquesEvent, TechniquesState> {
  final GetTechniquesByCategory _getTechniquesByCategory;
  final GetTechniques _getTechniques;

  TechniquesBloc(this._getTechniquesByCategory, this._getTechniques) : super(TechniquesLoading());

  @override
  Stream<TechniquesState> mapEventToState(
    TechniquesEvent event,
  ) async* {
    if (event is LoadTechniquesByCategory)
      yield TechniquesLoaded((await _getTechniquesByCategory(event.category)).toList());
    else if (event is LoadAllTechniques)
      yield TechniquesLoaded((await _getTechniques()).toList());
    else if (event is TextSearchPerformed) yield state.copyWith(keywords: event.keywords);
  }
}
