import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

String calculate() {
  return NumberFormat.percent().formatDouble(0.5);
}

class NumberFormat {
  final bool isPercent;
  NumberFormat._(this.isPercent);

  factory NumberFormat.percent() => NumberFormat._(true);

  String formatDouble(double d) =>
      format(d, isPercent).cast<Utf8>().toDartString();

  @Native<Pointer<Char> Function(Double, Bool)>()
  @ResourceIdentifier('format')
  external static Pointer<Char> format(double d, bool isPercent);
}
