import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  const BasicCard({
    required this.child,
    required this.onTap,
    required this.color,
    super.key,
  });
  final Widget child;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 2.5 / 3.5,
                    child: ColoredBox(
                      color: color,
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
