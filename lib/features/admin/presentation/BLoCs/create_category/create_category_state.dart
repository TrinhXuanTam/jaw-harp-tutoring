part of 'create_category_bloc.dart';

@immutable
abstract class CreateCategoryState {}

class CreateCategoryNotFinishedState extends CreateCategoryState {}

class CreateCategoryFinishedState extends CreateCategoryState {}
