import 'package:beercules/common/widgets/beercules_button.dart';
import 'package:beercules/common/widgets/beercules_icon_button.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/home/home_model.dart';
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
            child: BeerculesIconButton(
              onPressed: () => controller.showModalLegalNotice(
                widget: buildLegalNotice(),
              ),
              icon: Icons.info,
            ),
          ),
          Column(
            children: <Widget>[
              const Text(
                LocaleKeys.home_view_title,
                style: TextStyles.header1,
              ).tr(),
              const SizedBox(height: 8),
              const Text(
                LocaleKeys.home_view_sub_title,
                style: TextStyles.header3,
              ).tr(),
              const SizedBox(height: 32),
              Assets.images.logo.image(),
              const SizedBox(height: 32),
              BeerculesButton(
                text: LocaleKeys.home_view_button_go_drinking.tr(),
                onPressed: controller.goToGameView,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: BeerculesButton(
                      text: LocaleKeys.home_view_button_rules.tr(),
                      onPressed: controller.goToRulesView,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: BeerculesButton(
                      text: LocaleKeys.home_view_button_customize.tr(),
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

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(super._state);

  void goToCustomizeView();
  void goToGameView();
  void goToRulesView();
  void showModalLegalNotice({required final Widget widget});
}
