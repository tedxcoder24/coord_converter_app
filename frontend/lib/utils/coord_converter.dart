class CoordConverter {
  static String toDMS(double decimalDegree, {required bool isLat}) {
    final direction = isLat
        ? (decimalDegree >= 0 ? 'N' : 'S')
        : (decimalDegree >= 0 ? 'E' : 'W');

    final absVal = decimalDegree.abs();
    final degrees = absVal.floor();
    final minutesDecimal = (absVal - degrees) * 60;
    final minutes = minutesDecimal.floor();
    final seconds = ((minutesDecimal - minutes) * 60).toStringAsFixed(2);

    return '$degrees° $minutes\' $seconds" $direction';
  }
}
