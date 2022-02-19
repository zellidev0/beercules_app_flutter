import 'package:beercules_flutter/home/home_controller.dart';
import 'package:beercules_flutter/home/home_model.dart';
import 'package:beercules_flutter/providers.dart';
import 'package:beercules_flutter/scaffold_widget.dart';
import 'package:beercules_flutter/theme.dart';
import 'package:easy_localization/easy_localization.dart';
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
            _buildButtons(),
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
        style: TextStyles.header2,
      ).tr();

  Widget _buildLogo() => Image.asset("assets/images/logo.png");

  Widget _buildButtons() => Column(
        children: [
          _buildButton(textResource: "home_view.button.go_drinking"),
          _buildButton(textResource: "home_view.button.rules"),
          _buildButton(textResource: "home_view.button.customize"),
        ],
      );

  Widget _buildButton({required String textResource}) => SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(textResource).tr(),
        ),
      );
}
