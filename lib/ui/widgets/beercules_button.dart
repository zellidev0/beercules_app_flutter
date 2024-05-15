import 'package:beercules/common/theme.dart';
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
          style: ElevatedButton.styleFrom(
            backgroundColor: BeerculesColors.primary,
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
