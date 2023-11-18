import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final bool useSafeAre;

  const ScaffoldWidget({
    required this.child,
    super.key,
    this.appBar,
    this.useSafeAre = true,
  });

  @override
  Widget build(final BuildContext context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Material(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(
              child: useSafeAre ? SafeArea(child: child) : child,
            ),
            appBar: appBar,
          ),
        ),
      );
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('useSafeAre', useSafeAre));
  }
}
