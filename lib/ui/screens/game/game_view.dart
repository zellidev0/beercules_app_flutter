import 'dart:math';

import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/ui/screens/game/game_model.dart';
import 'package:beercules/ui/screens/game/game_providers.dart';
import 'package:beercules/ui/screens/game/widgets/game_view_bottom_banner_ad.dart';
import 'package:beercules/ui/screens/game/widgets/game_view_remaining_cards.dart';
import 'package:beercules/ui/widgets/playing_card_container.dart';
import 'package:beercules/ui/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final int? initialCards = ref.watch(
      gameModelProvider.select((final GameModel value) => value.initialCards),
    );
    final BannerAd? bannerAd = ref.watch(
      gameModelProvider.select((final GameModel value) => value.bannerAd),
    );

    return ScaffoldWidget(
      padding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (bannerAd != null) GameViewBottomBannerAd(ad: bannerAd),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: List<GameCard>.generate(
                initialCards ?? 0,
                (final int index) => GameCard(
                  key: ValueKey<int>(index),
                  cardNumber: index,
                  onSelectCard: (final int cardNumber) async => ref
                      .read(gameControllerProvider)
                      .selectCard(cardNumber: cardNumber),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(32),
            child: GameViewRemainingCards(),
          ),
        ],
      ),
    );
  }
}

class GameCard extends ConsumerStatefulWidget {
  const GameCard({
    required this.cardNumber,
    required this.onSelectCard,
    super.key,
  });

  final int cardNumber;
  final void Function(int cardNumber) onSelectCard;

  @override
  ConsumerState<GameCard> createState() => _GameCardState();
}

class _GameCardState extends ConsumerState<GameCard> {
  late final int randomTranslation;
  late final int transformationAngle;
  late final Widget content;
  late bool cardWasPlayed;

  @override
  void initState() {
    final Random random = Random(widget.cardNumber);

    super.initState();
    cardWasPlayed = false;
    randomTranslation = random.nextInt(20);
    transformationAngle = random.nextInt(20);

    content = Transform.rotate(
      angle: transformationAngle.toDouble(),
      child: Transform.translate(
        offset: Offset(
          64,
          44 + randomTranslation.toDouble(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: AspectRatio(
            aspectRatio: 2.5 / 3.5,
            child: RepaintBoundary(
              child: Swipable(
                key: ValueKey<int>(widget.cardNumber),
                threshold: 4,
                onSwipeEnd: (final _, final __) async {
                  setState(() {
                    cardWasPlayed = true;
                  });
                  widget.onSelectCard(widget.cardNumber);
                },
                child: Visibility(
                  visible: !cardWasPlayed,
                  child: PlayingCardContainer(
                    onTap: () {
                      Future<void>.delayed(
                        const Duration(milliseconds: 200),
                        () => setState(() => cardWasPlayed = true),
                      );
                      widget.onSelectCard(widget.cardNumber);
                    },
                    child: Assets.images.logo.image(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    if (cardWasPlayed) return const SizedBox.shrink();
    return content;
  }
}

abstract class GameController {
  void pop();
  Future<void> selectCard({required final int cardNumber});
  void goBackToHome();
}
