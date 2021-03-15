import 'package:optional/optional.dart';

extension OptionalToNullable<T> on Optional<T> {
  T? toNullable() {
    return this.isPresent ? this.value : null;
  }
}
