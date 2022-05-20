import 'package:beercules/home/home_controller.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeController.notifier);
    return ScaffoldWidget(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: _buildInfoIconButton(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(height: 8),
              _buildSubTitle(),
              const SizedBox(height: 32),
              _buildLogo(controller: controller),
              const SizedBox(height: 32),
              _buildButtons(controller: controller),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }

  IconButton _buildInfoIconButton(BuildContext context) => IconButton(
        color: Theme.of(context).colorScheme.primary,
        splashColor: Theme.of(context).colorScheme.onPrimary,
        splashRadius: 16,
        onPressed: () async {
          var legalNotice = await rootBundle.loadString(
            'assets/legal/${"general.legal_notice_path".tr()}',
          );
          await showModalBottomSheet(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Html(
                  data: legalNotice,
                ),
              ),
            ),
            context: context,
          );
        },
        icon: const Icon(
          Icons.info,
        ),
      );

  Widget _buildTitle() => const Text(
        'home_view.title',
        style: TextStyles.header1,
      ).tr();

  Widget _buildSubTitle() => const Text(
        'home_view.sub_title',
        style: TextStyles.header3,
      ).tr();

  Widget _buildLogo({required HomeController controller}) =>
      Image.asset("assets/images/logo.png");

  Widget _buildButtons({required HomeController controller}) => Column(
        children: [
          buildButton(
            textResource: "home_view.button.go_drinking",
            onPressed: controller.goToGameView,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: buildButton(
                  textResource: "home_view.button.rules",
                  onPressed: controller.goToRulesView,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: buildButton(
                  textResource: "home_view.button.customize",
                  onPressed: controller.goToCustomizeView,
                ),
              ),
            ],
          )
        ],
      );
}
