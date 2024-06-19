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
    final List<GameModelCard> cards = ref.watch(
      gameModelProvider
          .select((final GameModel value) => value.notYetPlayedCards),
    );
    final BannerAd? ad = ref.watch(
      gameModelProvider.select((final GameModel value) => value.bannerAd),
    );

    return ScaffoldWidget(
      padding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (ad != null) GameViewBottomBannerAd(ad: ad),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: cards
                  .map(
                    (final GameModelCard card) => GameCard(
                      key: ValueKey<GameModelCard>(card),
                      card: card,
                      onSelectCard: (final GameModelCard card) async => ref
                          .read(gameControllerProvider)
                          .selectCard(card: card),
                    ),
                  )
                  .toList(),
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

class GameCard extends StatefulWidget {
  const GameCard({
    required this.card,
    required this.onSelectCard,
    super.key,
  });

  final GameModelCard card;
  final void Function(GameModelCard card) onSelectCard;

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  late final int _randomTranslation;
  late bool cardWasPlayed;

  @override
  void initState() {
    super.initState();
    cardWasPlayed = false;
    _randomTranslation = Random(widget.card.id.hashCode).nextInt(20);
  }

  @override
  Widget build(final BuildContext context) => Transform.rotate(
        angle: widget.card.transformationAngle.toDouble(),
        child: Transform.translate(
          offset: Offset(
            64,
            44 + _randomTranslation.toDouble(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: AspectRatio(
              aspectRatio: 2.5 / 3.5,
              child: RepaintBoundary(
                child: Swipable(
                  threshold: 4,
                  onSwipeEnd: (final _, final __) async {
                    setState(() {
                      cardWasPlayed = true;
                    });
                    widget.onSelectCard(widget.card);
                  },
                  child: Visibility(
                    visible: !cardWasPlayed,
                    child: PlayingCardContainer(
                      onTap: () {
                        Future<void>.delayed(
                          const Duration(milliseconds: 200),
                          () => setState(() => cardWasPlayed = true),
                        );
                        widget.onSelectCard(widget.card);
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

abstract class GameController {
  void pop();
  Future<void> selectCard({required final GameModelCard card});
  void goBackToHome();
}
