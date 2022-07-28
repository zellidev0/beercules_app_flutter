import 'package:beercules/scaffold_widget.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingView extends ConsumerWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => ScaffoldWidget(
        useSafeAre: false,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  _buildTopContent(constraints: constraints, context: context),
                  _buildReviews(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildReviews() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16),
            child: Text(
              'landing_view.reviews.title'.tr(),
              style: TextStyles.header4,
            ).tr(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildReviewCard(
                  textResource: 'landing_view.reviews.review1.reviewText',
                  authorResource: 'landing_view.reviews.review1.reviewAuthor',
                  amountOfFullStar: 5,
                ),
                buildReviewCard(
                  textResource: 'landing_view.reviews.review2.reviewText',
                  authorResource: 'landing_view.reviews.review2.reviewAuthor',
                  amountOfFullStar: 5,
                ),
                buildReviewCard(
                  textResource: 'landing_view.reviews.review3.reviewText',
                  authorResource: 'landing_view.reviews.review3.reviewAuthor',
                  amountOfFullStar: 4,
                ),
                buildReviewCard(
                  textResource: 'landing_view.reviews.review4.reviewText',
                  authorResource: 'landing_view.reviews.review4.reviewAuthor',
                  amountOfFullStar: 5,
                ),
              ],
            ),
          )
        ],
      );

  Widget _buildFeatures() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16),
            child: Text(
              'landing_view.reviews.title'.tr(),
              style: TextStyles.header4,
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 128),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                  .tr(),
              style: TextStyles.body1,
            ).tr(),
          ),
        ],
      );

  Widget _buildTopContent({
    required BoxConstraints constraints,
    required BuildContext context,
  }) =>
      Container(
        constraints: constraints.copyWith(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          children: [
            _buildAppBar(),
            _buildSloganAndMockup(),
          ],
        ),
      );

  Widget _buildSloganAndMockup() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Text(
                'landing_view.best_app_slogan'.tr(),
                style: TextStyles.header1,
              ).tr(),
              Image.asset("assets/mockups/iphone_home_2.png"),
            ].map((_) => Expanded(child: _)).toList(),
          ),
        ),
      );

  Widget _buildAppBar() => Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 64,
              child: Image.asset("assets/images/logo.png"),
            ),
            Text('general.app_name'.tr(), style: TextStyles.header1).tr(),
          ],
        ),
      );

  Widget buildReviewCard({
    required String textResource,
    required String authorResource,
    required int amountOfFullStar,
  }) =>
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Card(
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        amountOfFullStar - 1,
                        (index) => const Icon(Icons.star, color: Colors.white),
                      )
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: e,
                            ),
                          )
                          .toList(),
                      ...[
                        amountOfFullStar < 5
                            ? const Icon(Icons.star_half, color: Colors.white)
                            : const Icon(Icons.star, color: Colors.white),
                      ]
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
