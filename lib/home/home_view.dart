import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/common/widgets/bc_icon_button.dart';
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
          Align(
            alignment: Alignment.topRight,
            child: BcIconButton(
              onPressed: () => controller.showModalLegalNotice(
                widget: buildLegalNotice(),
              ),
              icon: Icons.info,
            ),
          ),
          Column(
            children: <Widget>[
              const Text(
                'home_view.title',
                style: TextStyles.header1,
              ).tr(),
              const SizedBox(height: 8),
              const Text(
                'home_view.sub_title',
                style: TextStyles.header3,
              ).tr(),
              const SizedBox(height: 32),
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 32),
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
                  const SizedBox(width: 32),
                  Expanded(
                    child: BcButton(
                      textResource: 'home_view.button.customize',
                      onPressed: controller.goToCustomizeView,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLegalNotice() => FutureBuilder<String>(
        // ignore: discarded_futures
        future: rootBundle.loadString(
          'assets/legal/${"general.legal_notice_path".tr()}',
        ),
        builder: (final _, final AsyncSnapshot<String> snapshot) =>
            switch (snapshot.connectionState) {
          ConnectionState.waiting => const CircularProgressIndicator(),
          _ => Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Html(data: snapshot.data),
              ),
            ),
        },
      );
}
