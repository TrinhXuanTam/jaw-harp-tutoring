import 'package:equatable/equatable.dart';
import 'package:optional/optional.dart';

/// Visual media entity of lectures and categories.
class Media extends Equatable {
  /// File path on the physical device.
  final Optional<String> url;

  /// Url for remote access.
  final Optional<String> filePath;

  Media({
    this.url = const Optional.empty(),
    this.filePath = const Optional.empty(),
  });

  @override
  List<Object?> get props => [this.url, this.filePath];
}
