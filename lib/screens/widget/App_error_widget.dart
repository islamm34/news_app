import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String errorMessage;

  const AppErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
