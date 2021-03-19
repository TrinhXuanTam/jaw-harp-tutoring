import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

class Media extends Equatable {
  final Optional<String> url;
  final Optional<String> filePath;

  Media({
    this.url = const Optional.empty(),
    this.filePath = const Optional.empty(),
  });

  @override
  List<Object?> get props => [this.url, this.filePath];
}
