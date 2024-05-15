import 'package:flutter/material.dart';

class BeerculesIconButton extends StatelessWidget {
  const BeerculesIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => IconButton(
        padding: const EdgeInsets.all(16),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      );
}
