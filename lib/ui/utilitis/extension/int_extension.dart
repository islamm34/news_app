import 'package:flutter/cupertino.dart';

extension IntExtension on int {
  SizedBox VerticalSpace() => SizedBox(height: this.toDouble());

  SizedBox HorizontalSpace() => SizedBox(width: this.toDouble());
}
