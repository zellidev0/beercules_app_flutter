import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class BeerculesButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BeerculesButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => RepaintBoundary(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: TextStyles.body2,
            ),
          ),
        ),
      );
}
