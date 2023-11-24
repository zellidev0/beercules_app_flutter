import 'package:beercules/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayingCardContainer extends StatelessWidget {
  const PlayingCardContainer({
    required this.child,
    this.onTap,
    super.key,
  });
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) => Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: BeerculesColors.primary,
            child: AspectRatio(
              aspectRatio: 2.5 / 3.5,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: child,
              ),
            ),
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
