import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';

/// Purchase a technique of given [productId].
@LazySingleton(env: [Environment.prod, Environment.dev])
class PurchaseTechnique {
  final IUserSectionFacade _userSectionFacade;

  PurchaseTechnique(this._userSectionFacade);

  Future<void> call(Technique technique) => _userSectionFacade.purchaseTechnique(technique);
}
