part of 'filter_screen_bloc.dart';

@immutable
class FilterScreenState {
  final TextEditingController searchController;
  final DropdownButtonFormFieldController<TechniqueOrder> orderController;

  FilterScreenState(this.searchController, this.orderController);

  FilterScreenState copy() => FilterScreenState(this.searchController, this.orderController);
}
