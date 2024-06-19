import 'package:beercules/common/constants.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/screens/home/home_providers.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LegalNotice extends ConsumerWidget {
  const LegalNotice({
    super.key,
  });

  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      FutureBuilder<String>(
        // ignore: discarded_futures
        future: rootBundle.loadString(
          'assets/legal/${"general.legal_notice_path".tr()}',
        ),
        builder: (final _, final AsyncSnapshot<String> snapshot) =>
            switch (snapshot.connectionState) {
          ConnectionState.waiting => const CircularProgressIndicator(),
          _ => Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  if (Constants.adsEnabled)
                    BeerculesButton(
                      text: LocaleKeys.home_view_tracking_consent_button.tr(),
                      onPressed:
                          ref.read(homeControllerProvider).resetTrackingConsent,
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Html(data: snapshot.data),
                    ),
                  ),
                ],
              ),
            ),
        },
      );
}
