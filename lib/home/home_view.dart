import 'package:beercules/home/home_controller.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeController.notifier);
    return ScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(height: 8),
            _buildSubTitle(),
            const SizedBox(height: 32),
            _buildLogo(),
            const SizedBox(height: 32),
            _buildButtons(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() => const Text(
        'home_view.title',
        style: TextStyles.header1,
      ).tr();

  Widget _buildSubTitle() => const Text(
        'home_view.sub_title',
        style: TextStyles.header3,
      ).tr();

  Widget _buildLogo() => Image.asset("assets/images/logo.png");

  Widget _buildButtons({required HomeController controller}) => Column(
        children: [
          _buildButton(
            textResource: "home_view.button.go_drinking",
            onPressed: controller.goToGameView,
          ),
          const SizedBox(height: 8),
          _buildButton(
            textResource: "home_view.button.rules",
            onPressed: controller.goToRulesView,
          ),
          const SizedBox(height: 8),
          _buildButton(
            textResource: "home_view.button.customize",
            onPressed: controller.goToCustomizeView,
          ),
        ],
      );

  Widget _buildButton({
    required String textResource,
    required VoidCallback? onPressed,
  }) =>
      SizedBox(
        width: 200,
        child: buildButton(
          onPressed: onPressed,
          textResource: textResource,
        ),
      );
}
