import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/user_section/application/purchase_technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'purchase_technique_event.dart';

part 'purchase_technique_state.dart';

/// Purchase technique state management.
@Injectable(env: [Environment.prod, Environment.dev])
class PurchaseTechniqueBloc extends Bloc<PurchaseTechniqueEvent, PurchaseTechniqueState> {
  final PurchaseTechnique _purchaseTechnique;
  final ErrorBloc _errorBloc;

  PurchaseTechniqueBloc(this._purchaseTechnique, this._errorBloc) : super(PurchaseTechniqueInitial());

  @override
  Stream<PurchaseTechniqueState> mapEventToState(
    PurchaseTechniqueEvent event,
  ) async* {
    if (event is PurchaseTechniqueEvent) {
      try {
        await _purchaseTechnique(event.technique);
        event.user.purchasedTechniques.add(event.technique.id);
        yield TechniquePurchased();
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Purchase Failed", e.message));
      }
    }
  }
}
