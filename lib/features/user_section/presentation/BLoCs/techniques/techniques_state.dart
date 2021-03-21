part of 'techniques_bloc.dart';

@immutable
abstract class TechniquesState {
  final String searchKeywords;

  TechniquesState({this.searchKeywords = ""});

  TechniquesState copyWith({required String? keywords});
}

class TechniquesLoading extends TechniquesState {
  TechniquesLoading({String searchKeywords = ""}) : super(searchKeywords: searchKeywords);

  @override
  TechniquesLoading copyWith({required String? keywords}) {
    return TechniquesLoading(
      searchKeywords: keywords == null ? this.searchKeywords : keywords,
    );
  }
}

class TechniquesLoaded extends TechniquesState {
  final List<Technique> _techniques;

  List<Technique> _textSearch(List<Technique> techniques) {
    if (this.searchKeywords.isEmpty) return _techniques;

    return _techniques.where((element) {
      final keywords = this.searchKeywords.split(" ");
      return element.localizedData.values.any((element) => keywords.any((word) => element.title.contains(new RegExp(word, caseSensitive: false))));
    }).toList();
  }

  List<Technique> get techniques {
    return _textSearch(_techniques);
  }

  TechniquesLoaded(this._techniques, {String searchKeywords = ""}) : super(searchKeywords: searchKeywords);

  @override
  TechniquesLoaded copyWith({List<Technique>? techniques, required String? keywords}) {
    return TechniquesLoaded(
      techniques == null ? this._techniques : techniques,
      searchKeywords: keywords == null ? this.searchKeywords : keywords,
    );
  }
}
