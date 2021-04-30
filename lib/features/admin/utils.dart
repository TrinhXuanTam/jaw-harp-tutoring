import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

int categoryTitleCmp(Category lhs, Category rhs) {
  return lhs.title.compareTo(rhs.title);
}

int techniqueTitleCmp(Technique lhs, Technique rhs) {
  return lhs.title.compareTo(rhs.title);
}
