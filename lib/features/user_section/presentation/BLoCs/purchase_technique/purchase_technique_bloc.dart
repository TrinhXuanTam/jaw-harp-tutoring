import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/user_section/application/purchase_technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'purchase_technique_event.dart';

part 'purchase_technique_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class PurchaseTechniqueBloc extends Bloc<PurchaseTechniqueEvent, PurchaseTechniqueState> {
  final PurchaseTechnique _purchaseTechnique;

  PurchaseTechniqueBloc(this._purchaseTechnique) : super(PurchaseTechniqueInitial());

  @override
  Stream<PurchaseTechniqueState> mapEventToState(
    PurchaseTechniqueEvent event,
  ) async* {
    if (event is PurchaseTechniqueEvent) {
      await _purchaseTechnique(event.technique);
      event.user.purchasedTechniques.add(event.technique.id);
      yield TechniquePurchased();
    }
  }
}
