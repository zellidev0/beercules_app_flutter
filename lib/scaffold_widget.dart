import 'package:beercules_flutter/theme.dart';
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
        child: Scaffold(
          backgroundColor: BeerculesColors.primary,
          body: SafeArea(child: child),
          appBar: appBar,
        ),
      );
}
