import 'package:sizer/sizer.dart';

class AppFontSize {
  static double of(double base) {
    final scaled = base.sp;
    final min = base * 0.9;
    final max = base * 1.2;
    return scaled.clamp(min, max).toDouble();
  }
}
