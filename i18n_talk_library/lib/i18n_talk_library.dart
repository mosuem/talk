String calculate() {
  return NumberFormat.percent().format(0.5);
}

class NumberFormat {
  final bool isPercent;
  NumberFormat._(this.isPercent);

  factory NumberFormat.percent() => NumberFormat._(true);

  String format(double d) => _format(d, isPercent);

  //TODO: Implement number formatting
  String _format(double d, bool isPercent) {
    throw UnimplementedError('Too lazy to write this...');
  }
}
