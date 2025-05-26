import 'package:beercules/common/constants.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;

  final bool _useSafeAre;
  final EdgeInsets _padding;

  const ScaffoldWidget({
    required this.child,
    super.key,
    bool useSafeAre = true,
    EdgeInsets padding = Constants.pagePadding,
  })  : _padding = padding,
        _useSafeAre = useSafeAre;

  @override
  Widget build(BuildContext context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
        child: Material(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
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
