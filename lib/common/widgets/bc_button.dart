import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class BcButton extends ElevatedButton {
  BcButton({
    required final String text,
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
            child: Text(
              text,
              style: TextStyles.body2,
            ),
          ),
        );
}
