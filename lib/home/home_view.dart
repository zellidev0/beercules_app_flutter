import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/home/home_controller.dart';
import 'package:beercules/providers.dart';
import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeController.notifier);
    return ScaffoldWidget(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topRight,
              child: _buildInfoIconButton(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
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
        ],
      ),
    );
  }

  Widget _buildInfoIconButton() => Builder(
        builder: (final BuildContext context) => IconButton(
          color: Theme.of(context).colorScheme.primary,
          splashColor: Theme.of(context).colorScheme.onPrimary,
          splashRadius: 16,
          onPressed: () async {
            final String legalNotice = await rootBundle.loadString(
              'assets/legal/${"general.legal_notice_path".tr()}',
            );
            // ignore:  use_build_context_synchronously, inference_failure_on_function_invocation
            await showModalBottomSheet(
              builder: (final BuildContext context) => Padding(
                padding: const EdgeInsets.all(8),
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

  Widget _buildLogo({required final HomeController controller}) =>
      Image.asset('assets/images/logo.png');

  Widget _buildButtons({required final HomeController controller}) => Column(
        children: <Widget>[
          BcButton(
            textResource: 'home_view.button.go_drinking',
            onPressed: controller.goToGameView,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BcButton(
                  textResource: 'home_view.button.rules',
                  onPressed: controller.goToRulesView,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BcButton(
                  textResource: 'home_view.button.customize',
                  onPressed: controller.goToCustomizeView,
                ),
              ),
            ],
          ),
        ],
      );
}
