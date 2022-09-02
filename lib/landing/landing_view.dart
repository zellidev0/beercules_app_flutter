import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;


class LandingView extends ConsumerWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => ScaffoldWidget(
        useSafeAre: false,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 80,
                flexibleSpace: FlexibleSpaceBar(title: _buildAppBarContent()),
                elevation: 0,
                backgroundColor: Colors.transparent,
                pinned: true,
                floating: false,
                expandedHeight: MediaQuery.of(context).size.height * 0.15,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                LayoutBuilder(
                  builder: (context, constraints) => Column(
                    children: [
                      _buildSloganAndMockup(
                        constraints: constraints,
                        context: context,
                      ),
                      _divider(),
                      _buildFeatures(),
                      _divider(),
                      _buildReviews(),
                      _buildLegal(),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ]))
            ],
          ),
        ),
      );

  Widget _buildLegal() => Text(
        'general.legal_google_play_notice'.tr(),
        style: TextStyles.body1.copyWith(color: Colors.white.withOpacity(0.4)),
      ).tr();

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Divider(color: Colors.white70),
      );

  Widget _buildReviews() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildReviewCard(
              textResource: 'landing_view.reviews.review1.reviewText',
              authorResource: 'landing_view.reviews.review1.reviewAuthor',
            ),
            buildReviewCard(
              textResource: 'landing_view.reviews.review2.reviewText',
              authorResource: 'landing_view.reviews.review2.reviewAuthor',
            ),
            buildReviewCard(
              textResource: 'landing_view.reviews.review3.reviewText',
              authorResource: 'landing_view.reviews.review3.reviewAuthor',
              halfStar: true,
            ),
            buildReviewCard(
              textResource: 'landing_view.reviews.review4.reviewText',
              authorResource: 'landing_view.reviews.review4.reviewAuthor',
            ),
          ],
        ),
      );

  Widget _buildFeatures() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 32),
            child: Text(
              'general.app_description'.tr(),
              style: TextStyles.header4.copyWith(fontWeight: FontWeight.w400),
            ).tr(),
          ),
          Row(
            children: [
              const Spacer(),
              _buildBadge(
                height: 80,
                badge: Image.asset("assets/legal/google-play-badge.png"),
              ),
              _buildBadge(
                height: 56,
                badge: SvgPicture.asset("assets/legal/app-store-badge.svg"),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 32),
        ],
      );

  Expanded _buildBadge({
    required double height,
    required Widget badge,
  }) =>
      Expanded(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: SizedBox(height: height, child: badge),
            onTap: () async {
              js.context.callMethod('open', ['https://beerculestrinkspiel.page.link/app']);
            },
          ),
        ),
      );

  Widget _buildSloganAndMockup({
    required BoxConstraints constraints,
    required BuildContext context,
  }) =>
      Container(
        constraints: constraints.copyWith(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: const EdgeInsets.all(44.0),
          child: Row(
            children: [
              Text(
                'landing_view.best_app_slogan'.tr(),
                style: TextStyles.header1,
              ).tr(),
              Image.asset("assets/mockups/mockup2.png"),
            ].map((_) => Expanded(child: _)).toList(),
          ),
        ),
      );

  Widget _buildAppBarContent() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 64,
            child: Image.asset("assets/images/logo.png"),
          ),
          Text('general.app_name'.tr(), style: TextStyles.header1).tr(),
        ],
      );

  Widget buildReviewCard({
    required String textResource,
    required String authorResource,
    bool halfStar = false,
  }) =>
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Card(
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        halfStar ? 4 : 5,
                        (index) => const Icon(Icons.star, color: Colors.white),
                      )
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: e,
                            ),
                          )
                          .toList(),
                      if (halfStar)
                        const Icon(Icons.star_half, color: Colors.white)
                    ],
                  ),
                ),
                Text(
                  textResource.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyles.body1,
                ).tr(),
                const SizedBox(height: 8),
                Text(
                  authorResource.tr(),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyles.body5,
                ).tr(),
              ],
            ),
          ),
        ),
      );
}
