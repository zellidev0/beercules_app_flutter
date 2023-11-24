import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class PlayingCardContainer extends StatelessWidget {
  final Widget _child;
  final VoidCallback? _onTap;
  const PlayingCardContainer({
    required final Widget child,
    final void Function()? onTap,
    super.key,
  })  : _onTap = onTap,
        _child = child;

  @override
  Widget build(final BuildContext context) => Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: _onTap,
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
                child: _child,
              ),
            ),
          ),
        ),
      );
}
