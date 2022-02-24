import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  required VoidCallback? onPressed,
  required String textResource,
}) =>
    _buildButton(
      child: Text(textResource).tr(),
      onPressed: onPressed,
    );

Widget buildIconButton({
  required VoidCallback onPressed,
  required IconData icon,
}) =>
    _buildButton(
      child: Icon(icon),
      onPressed: onPressed,
    );

Widget buildCard({
  required Widget child,
  required VoidCallback? onTap,
  required Color color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 2.5 / 3.5,
                  child: Container(
                    color: color,
                    child: Padding(
                        padding: const EdgeInsets.all(32.0), child: child),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget _buildButton({
  required Widget child,
  required VoidCallback? onPressed,
}) =>
    ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child);
