import 'package:beercules/common/constants.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;

  final bool _useSafeAre;
  final EdgeInsets _padding;

  const ScaffoldWidget({
    required this.child,
    super.key,
    final bool useSafeAre = true,
    final EdgeInsets padding = Constants.pagePadding,
  })  : _padding = padding,
        _useSafeAre = useSafeAre;

  @override
  Widget build(final BuildContext context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Material(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Padding(
              padding: _padding,
              child: Center(
                child: _useSafeAre ? SafeArea(child: child) : child,
              ),
            ),
          ),
        ),
      );
}
