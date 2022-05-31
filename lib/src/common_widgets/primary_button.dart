import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      width: 335.0,
      child: ElevatedButton(
          onPressed: onPressed,
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(text.toUpperCase())),
    );
  }
}
