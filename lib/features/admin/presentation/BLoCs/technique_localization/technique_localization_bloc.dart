import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_technique_localized_data.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_localization_event.dart';
part 'technique_localization_state.dart';

/// State management for loading localized data of a technique.
@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueLocalizationBloc extends Bloc<TechniqueLocalizationEvent, TechniqueLocalizationState> {
  final GetTechniqueLocalizedData _getTechniqueLocalizedData;

  TechniqueLocalizationBloc(this._getTechniqueLocalizedData) : super(TechniqueLocalizationLoading());

  @override
  Stream<TechniqueLocalizationState> mapEventToState(
    TechniqueLocalizationEvent event,
  ) async* {
    if (event is LoadTechniqueLocalizedData) {
      yield TechniqueLocalizationLoaded(await _getTechniqueLocalizedData(event.technique.id));
    }
  }
}
