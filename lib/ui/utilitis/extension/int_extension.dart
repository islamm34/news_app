import 'package:flutter/cupertino.dart';

extension IntExtension on int {
  SizedBox verticalSpace() => SizedBox(height: this.toDouble());

  SizedBox horizontalSpace() => SizedBox(width: this.toDouble());
}
