import 'package:flutter/material.dart';

class BcIconButton extends GestureDetector {
  BcIconButton({
    required final IconData icon,
    required final VoidCallback onPressed,
    super.key,
  }) : super(
          onTap: onPressed,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        );
}
