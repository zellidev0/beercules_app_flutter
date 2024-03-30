import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

class LegalNotice extends StatelessWidget {
  const LegalNotice({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => FutureBuilder<String>(
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
