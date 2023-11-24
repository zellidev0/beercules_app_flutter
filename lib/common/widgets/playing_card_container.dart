import 'package:beercules/common/constants.dart';
import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class PlayingCardContainer extends StatelessWidget {
  final Widget _child;
  final VoidCallback? _onTap;
  final EdgeInsets _padding;
  const PlayingCardContainer({
    required final Widget child,
    final void Function()? onTap,
    final EdgeInsets padding = Constants.pagePadding,
    super.key,
  })  : _onTap = onTap,
        _child = child,
        _padding = padding;

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
                padding: _padding,
                child: _child,
              ),
            ),
          ),
        ),
      );
}
