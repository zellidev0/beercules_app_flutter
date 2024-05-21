import 'package:beercules/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

typedef WidgetBuilder = Widget Function(BuildContext context, int index);

class CustomizeCarousel extends StatefulWidget {
  final String title;
  final int itemCount;
  final WidgetBuilder builder;
  final void Function({required int itemIndex}) _onPageChanged;
  final PageController pageController;

  const CustomizeCarousel({
    required this.title,
    required final void Function({required int itemIndex}) onPageChanged,
    required this.itemCount,
    required this.builder,
    required this.pageController,
    super.key,
  }) : _onPageChanged = onPageChanged;

  @override
  State<CustomizeCarousel> createState() => _CustomizeCarouselState();
}

class _CustomizeCarouselState extends State<CustomizeCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = widget.pageController;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildCarouselTitle(carouselTitle: widget.title),
          const SizedBox(height: 16),
          _buildCarousel(),
          const SizedBox(height: 16),
          Center(child: _buildSmoothPageIndicator()),
        ],
      );

  Widget _buildCarousel() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: LayoutBuilder(
          builder: (final _, final BoxConstraints constraints) => AspectRatio(
            aspectRatio: constraints.maxWidth /
                ((constraints.maxWidth / Constants.cardAspectRatio) -
                    (12 * 4)) /
                widget.pageController.viewportFraction,
            child: PageView.builder(
              pageSnapping: false,
              clipBehavior: Clip.none,
              padEnds: false,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (final int itemIndex) => widget._onPageChanged(
                itemIndex: itemIndex,
              ),
              controller: _pageController,
              itemCount: widget.itemCount,
              itemBuilder: (final BuildContext context, final int index) =>
                  Padding(
                padding: const EdgeInsets.only(right: 12),
                child: widget.builder(context, index),
              ),
            ),
          ),
        ),
      );

  Builder _buildCarouselTitle({
    required final String carouselTitle,
  }) =>
      Builder(
        builder: (final BuildContext context) => Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            carouselTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      );

  Widget _buildSmoothPageIndicator() => Builder(
        builder: (final BuildContext context) => SmoothPageIndicator(
          controller: _pageController,
          count: widget.itemCount,
          effect: ScrollingDotsEffect(
            activeDotColor: Theme.of(context).colorScheme.secondary,
            activeDotScale: 1,
            dotColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
            dotHeight: 8,
            dotWidth: 8,
            spacing: 4,
          ),
        ),
      );
}
