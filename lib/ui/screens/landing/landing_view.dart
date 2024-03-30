import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingView extends ConsumerWidget {
  static const double desktopThreshold = 1200;
  const LandingView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      LayoutBuilder(
        builder: (
          final BuildContext context,
          final BoxConstraints constraints,
        ) =>
            ScaffoldWidget(
          useSafeAre: false,
          padding: EdgeInsets.zero,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  sliver: SliverAppBar(
                    toolbarHeight: 80,
                    flexibleSpace: FlexibleSpaceBar(
                      title: _buildAppBarContent(),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    expandedHeight: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        constraints.maxWidth < desktopThreshold ? 32 : 400,
                    vertical: 32,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      _buildSloganAndMockup(
                        constraints: constraints,
                        context: context,
                      ),
                      _divider(),
                      _buildFeatures(),
                      _divider(),
                    ]),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _buildReviews(),
                  ]),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        constraints.maxWidth < desktopThreshold ? 32 : 64,
                    vertical: 32,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      _buildLegal(),
                      const SizedBox(height: 16),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildLegal() => Text(
        LocaleKeys.general_legal_google_play_notice,
        style: TextStyles.body4.copyWith(color: Colors.white.withOpacity(0.4)),
      ).tr();

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Divider(color: Colors.white70),
      );

  Widget _buildReviews() => Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              buildReviewCard(
                text: LocaleKeys.landing_view_reviews_review1_reviewText.tr(),
                author:
                    LocaleKeys.landing_view_reviews_review1_reviewAuthor.tr(),
              ),
              buildReviewCard(
                text: LocaleKeys.landing_view_reviews_review2_reviewText.tr(),
                author:
                    LocaleKeys.landing_view_reviews_review2_reviewAuthor.tr(),
              ),
              buildReviewCard(
                text: LocaleKeys.landing_view_reviews_review3_reviewText.tr(),
                author:
                    LocaleKeys.landing_view_reviews_review3_reviewAuthor.tr(),
              ),
              buildReviewCard(
                text: 'landing_view.reviews.review3.reviewText',
                author: 'landing_view.reviews.review3.reviewAuthor',
                halfStar: true,
              ),
              buildReviewCard(
                text: LocaleKeys.landing_view_reviews_review4_reviewText.tr(),
                author:
                    LocaleKeys.landing_view_reviews_review4_reviewAuthor.tr(),
              ),
            ],
          ),
        ),
      );

  Widget _buildFeatures() => LayoutBuilder(
        builder: (final _, final BoxConstraints constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth < desktopThreshold ? 16 : 128,
                vertical: 32,
              ),
              child: Text(
                LocaleKeys.general_app_description.tr(),
                style: TextStyles.header4.copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ).tr(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildBadge(
                  badge: Assets.legal.googlePlayBadge.svg(),
                  isIos: false,
                ),
                _buildBadge(
                  badge: Assets.legal.appStoreBadge.svg(),
                  isIos: true,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      );

  Widget _buildBadge({
    required final Widget badge,
    required final bool isIos,
  }) =>
      Flexible(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: badge,
            onTap: () async => launchUrl(
              isIos
                  ? Uri.parse(
                      'https://apps.apple.com/us/app/beercules/id1469757352',
                    )
                  : Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.jzellner98.thedrinkinggame',
                    ),
            ),
          ),
        ),
      );

  Widget _buildSloganAndMockup({
    required final BoxConstraints constraints,
    required final BuildContext context,
  }) {
    if (constraints.maxWidth < desktopThreshold) {
      return Column(
        children: <Widget>[
          Text(
            LocaleKeys.landing_view_best_app_slogan.tr(),
            style: TextStyles.header1,
            textAlign: TextAlign.center,
          ).tr(),
          const SizedBox(height: 32),
          Assets.mockups.mockup2.image(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          const SizedBox(height: 40),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(44),
        child: Row(
          children: <Widget>[
            Text(
              LocaleKeys.landing_view_best_app_slogan.tr(),
              style: TextStyles.header1,
            ).tr(),
            Assets.mockups.mockup2.image(
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ].map((final _) => Expanded(child: _)).toList(),
        ),
      );
    }
  }

  Widget _buildAppBarContent() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 64,
            child: Assets.images.logo.image(),
          ),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: const Text(
                LocaleKeys.general_app_name,
                style: TextStyles.header1,
              ).tr(),
            ),
          ),
        ],
      );

  Widget buildReviewCard({
    required final String text,
    required final String author,
    final bool halfStar = false,
  }) =>
      Padding(
        padding: const EdgeInsets.all(32),
        child: Card(
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ...List<Icon>.generate(
                        halfStar ? 4 : 5,
                        (final int index) =>
                            const Icon(Icons.star, color: Colors.white),
                      ).map<Widget>(
                        (final Icon e) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: e,
                        ),
                      ),
                      if (halfStar)
                        const Icon(Icons.star_half, color: Colors.white),
                    ],
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyles.body1,
                ),
                const SizedBox(height: 8),
                Text(
                  author,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyles.body5,
                ),
              ],
            ),
          ),
        ),
      );
}
