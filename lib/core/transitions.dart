import 'package:flutter/cupertino.dart';

/// Makes a fade transition from old widget to new widget within a duration of [milliseconds] milliseconds.
/// If the old widget and new widget are the same type, different[key] value is required for each widget.
AnimatedSwitcher fadeTransition(Widget widget, {int milliseconds = 1000, key = 0}) {
  return AnimatedSwitcher(
    transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
    duration: Duration(milliseconds: milliseconds),
    key: ValueKey(key),
    child: widget,
  );
}
