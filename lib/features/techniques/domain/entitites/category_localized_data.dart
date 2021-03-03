import 'package:equatable/equatable.dart';

class CategoryLocalizedData extends Equatable {
  final String languageCode;

  CategoryLocalizedData(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}
