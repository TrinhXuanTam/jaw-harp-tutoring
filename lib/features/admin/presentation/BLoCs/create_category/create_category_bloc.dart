import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'create_category_event.dart';

part 'create_category_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc() : super(CreateCategoryInitial());

  @override
  Stream<CreateCategoryState> mapEventToState(
    CreateCategoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
