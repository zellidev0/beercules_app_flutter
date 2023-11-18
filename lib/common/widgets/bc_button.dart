import 'package:flutter/material.dart';

class BcButton extends ElevatedButton {
  BcButton({
    required final Widget child,
    required super.onPressed,
    super.key,
  }) : super(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        );
}
