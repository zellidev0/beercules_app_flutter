import 'package:beercules/common/theme.dart';
import 'package:flutter/material.dart';

class BeerculesButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BorderRadius? radius;
  final EdgeInsets padding;

  const BeerculesButton({
    required this.text,
    required this.onPressed,
    super.key,
  })  : radius = null,
        padding = const EdgeInsets.all(16);

  const BeerculesButton.rectangular({
    required this.text,
    required this.onPressed,
    super.key,
  })  : radius = const BorderRadius.all(Radius.circular(8)),
        padding = const EdgeInsets.all(8);

  @override
  Widget build(final BuildContext context) => RepaintBoundary(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: BeerculesColors.primary,
            shape: radius != null
                ? RoundedRectangleBorder(borderRadius: radius!)
                : null,
          ),
          onPressed: onPressed,
          child: Padding(
            padding: padding,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.body2,
            ),
          ),
        ),
      );
}
