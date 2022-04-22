import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;

  const ScaffoldWidget({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Material(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(child: SafeArea(child: child)),
            appBar: appBar,
          ),
        ),
      );
}
