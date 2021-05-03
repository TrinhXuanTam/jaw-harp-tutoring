import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/facade_interfaces/user_section_facade.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';
import 'package:jews_harp/features/user_section/infrastructure/external_services/payment_service.dart';

/// User section facade for handling user related login.
@LazySingleton(as: IUserSectionFacade, env: [Environment.prod])
class UserSectionFacade extends IUserSectionFacade {
  /// Service for making purchases.
  final PaymentService _paymentService;

  /// Firebase data source.
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  UserSectionFacade(this._paymentService, this._firebaseUserSectionDataSource);

  /// Add technique to favorites.
  @override
  Future<void> markTechniqueAsFavorite(String techniqueId) async {
    _firebaseUserSectionDataSource.markTechniqueAsFavorite(techniqueId);
  }

  /// Remove technique from favorites.
  @override
  Future<void> removeTechniqueFromFavorites(String techniqueId) async {
    _firebaseUserSectionDataSource.removeTechniqueFromFavorites(techniqueId);
  }

  /// Purchase technique and save to Firebase.+
  @override
  Future<void> purchaseTechnique(Technique technique) async {
    // Purchase the technique.
    await _paymentService.purchaseTechnique(technique.productId.value);

    // Save to firebase if transaction was successful.
    _firebaseUserSectionDataSource.addPurchasedTechnique(technique.id);
  }
}
