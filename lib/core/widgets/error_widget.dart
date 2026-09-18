import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({super.key, this.errorMessage = 'An error occurred'});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage, style: const TextStyle(color: Colors.red)));
  }
}
