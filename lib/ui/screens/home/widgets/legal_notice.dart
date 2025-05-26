import 'package:beercules/common/constants.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/services/ad_service/ad_service.dart';
import 'package:beercules/ui/screens/home/home_view.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class LegalNotice extends StatelessWidget {
  const LegalNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final adService = context.read<AdService>();
    return FutureBuilder<String>(
      // ignore: discarded_futures
      future: rootBundle.loadString(
        'assets/legal/${"general.legal_notice_path".tr()}',
      ),
      builder: (_, AsyncSnapshot<String> snapshot) =>
          switch (snapshot.connectionState) {
        ConnectionState.waiting => const CircularProgressIndicator(),
        _ => Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                if (Constants.adsEnabled)
                  BeerculesButton(
                    text: LocaleKeys.home_view_tracking_consent_button.tr(),
                    onPressed: adService.resetTrackingConsent,
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
}
