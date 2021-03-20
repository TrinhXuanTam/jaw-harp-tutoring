import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/repository_interfaces/category_repository.dart';
import 'package:jews_harp/features/user_section/infrastructure/data_sources/firebase_user_section_data_source.dart';

@LazySingleton(as: ICategoryRepository, env: [Environment.prod])
class CategoryRepository extends ICategoryRepository {
  final FirebaseUserSectionDataSource _firebaseUserSectionDataSource;

  CategoryRepository(this._firebaseUserSectionDataSource);

  @override
  Future<Iterable<Category>> getAllCategories() => _firebaseUserSectionDataSource.getAllCategories();
}
