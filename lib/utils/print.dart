import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

/// Prints a string representation of the object to the console.
void bas(Object? value, [Object? thisObject]) {
  if (!kDebugMode) return;
  if (value != null) {
    String line = value.toString();

    log(
      line,
      zone: Zone.current,
      name: (thisObject == null) ? value.runtimeType.toString() : thisObject.runtimeType.toString(),
      time: DateTime.now(),
    );
  } else {
    log('null');
  }
}

T basT<T>(T value) {
  log("Inside of basT");
  bas(value);
  return value;
}
