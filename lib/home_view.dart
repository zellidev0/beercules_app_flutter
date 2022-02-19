import 'package:beercules_flutter/home_controller.dart';
import 'package:beercules_flutter/home_model.dart';
import 'package:beercules_flutter/providers.dart';
import 'package:beercules_flutter/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeController.notifier);
    final HomeModel model = ref.watch(providers.homeController);
    return ScaffoldWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24),
          const SizedBox(height: 4),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
