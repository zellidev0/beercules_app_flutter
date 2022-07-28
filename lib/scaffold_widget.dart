import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final bool useSafeAre;

  const ScaffoldWidget({
    Key? key,
    required this.child,
    this.appBar,
    this.useSafeAre = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
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
}
