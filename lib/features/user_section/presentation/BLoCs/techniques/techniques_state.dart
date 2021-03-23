part of 'techniques_bloc.dart';

enum TechniqueOrder {
  defaultOrder,
  datePublished,
}

@immutable
abstract class TechniquesState {
  final String searchKeywords;
  final Optional<TechniqueOrder> techniqueOrder;

  TechniquesState({
    this.searchKeywords = "",
    this.techniqueOrder = const Optional.empty(),
  });

  TechniquesState copyWith({
    String? keywords,
    Optional<TechniqueOrder>? techniqueOrder,
  });
}

class TechniquesLoading extends TechniquesState {
  TechniquesLoading({
    String searchKeywords = "",
    Optional<TechniqueOrder> techniqueOrder = const Optional.empty(),
    bool descending = false,
  }) : super(searchKeywords: searchKeywords, techniqueOrder: techniqueOrder);

  @override
  TechniquesLoading copyWith({
    String? keywords,
    Optional<TechniqueOrder>? techniqueOrder,
  }) {
    return TechniquesLoading(
      searchKeywords: keywords == null ? this.searchKeywords : keywords,
      techniqueOrder: techniqueOrder == null ? this.techniqueOrder : techniqueOrder,
    );
  }
}

class TechniquesLoaded extends TechniquesState {
  final List<Technique> _techniques;

  List<Technique> _textSearch(List<Technique> techniques) {
    if (this.searchKeywords.isEmpty) return _techniques;

    return _techniques.where((element) {
      final keywords = this.searchKeywords.split(" ");
      return keywords.any((word) => element.title.contains(new RegExp(word, caseSensitive: false)));
    }).toList();
  }

  List<Technique> _sortTechniques(List<Technique> techniques) {
    if (this.techniqueOrder.isEmpty || this.techniqueOrder.value == TechniqueOrder.defaultOrder) return _techniques;

    final res = techniques.toList();

    if (this.techniqueOrder.value == TechniqueOrder.datePublished) res.sort(techniqueDatePublishedComparator);

    return res;
  }

  List<Technique> get techniques {
    final searchResult = _textSearch(_techniques);
    final sortedTechniques = _sortTechniques(searchResult);
    return sortedTechniques;
  }

  TechniquesLoaded(
    this._techniques, {
    String searchKeywords = "",
    Optional<TechniqueOrder> techniqueOrder = const Optional.empty(),
  }) : super(searchKeywords: searchKeywords, techniqueOrder: techniqueOrder);

  @override
  TechniquesLoaded copyWith({
    List<Technique>? techniques,
    String? keywords,
    Optional<TechniqueOrder>? techniqueOrder,
  }) {
    return TechniquesLoaded(
      techniques == null ? this._techniques : techniques,
      searchKeywords: keywords == null ? this.searchKeywords : keywords,
      techniqueOrder: techniqueOrder == null ? this.techniqueOrder : techniqueOrder,
    );
  }
}
