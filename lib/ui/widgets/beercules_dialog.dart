// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars

import 'package:auto_size_text/auto_size_text.dart';
import 'package:beercules/common/constants.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BeerculesGameDialog extends StatefulWidget {
  final int? activeGameRemainingCards;
  final int? customGameCardsAmount;
  final int defaultGameCardsAmount;
  final VoidCallback onContinue;
  final void Function({required bool isCustomGame}) onNewGame;
  const BeerculesGameDialog({
    required this.activeGameRemainingCards,
    required this.defaultGameCardsAmount,
    required this.customGameCardsAmount,
    required this.onContinue,
    required this.onNewGame,
    super.key,
  });

  @override
  State<BeerculesGameDialog> createState() => _BeerculesGameDialogState();
}

class _BeerculesGameDialogState extends State<BeerculesGameDialog> {
  bool isCustomGame = false;

  @override
  Widget build(final BuildContext context) => Material(
        color: Colors.black.withAlpha(100),
        child: Padding(
          padding: Constants.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: Constants.pagePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        LocaleKeys.game_view_popup_header.tr(),
                        style: TextStyles.header2,
                      ),
                      if (widget.activeGameRemainingCards != null &&
                          widget.activeGameRemainingCards! > 0)
                        ...buildContinue(
                          activeGameRemainingCards:
                              widget.activeGameRemainingCards!,
                        ),
                      if (widget.customGameCardsAmount != null)
                        _buildCustomOrDefaultSwitch(),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: BeerculesButton(
                            text: widget.activeGameRemainingCards != null
                                ? LocaleKeys
                                    .game_view_popup_custom_or_default_button_active_game_exists
                                    .tr()
                                : LocaleKeys
                                    .game_view_popup_custom_or_default_button_lets_go
                                    .tr(),
                            onPressed: () => widget.onNewGame(
                              isCustomGame: isCustomGame,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Row _buildCustomOrDefaultSwitch() => Row(
        children: <Widget>[
          buildText(
            text: isCustomGame
                ? translateWithCardAmount(
                    textResource: LocaleKeys
                        .game_view_popup_custom_or_default_switch_question_custom,
                    amount: widget.customGameCardsAmount!,
                  )
                : translateWithCardAmount(
                    textResource: LocaleKeys
                        .game_view_popup_custom_or_default_switch_question_default,
                    amount: widget.defaultGameCardsAmount,
                  ),
          ),
          Spacer(),
          Switch(
            value: isCustomGame,
            onChanged: (final bool customGameEnabled) {
              setState(() => isCustomGame = customGameEnabled);
            },
          ),
        ],
      );

  String translateWithCardAmount({
    required final String textResource,
    required final int amount,
  }) =>
      textResource.tr(
        namedArgs: <String, String>{
          'cards_amount': amount.toString(),
        },
      );

  Widget buildText({required final String text}) => Text(
        text,
        style: TextStyles.body1,
        textAlign: TextAlign.justify,
      );

  List<Widget> buildContinue({
    required final int activeGameRemainingCards,
  }) =>
      <Widget>[
        const SizedBox(height: 32),
        buildText(
          text: translateWithCardAmount(
            textResource: LocaleKeys.game_view_popup_continue_question,
            amount: activeGameRemainingCards,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: double.infinity,
            child: BeerculesButton(
              text: LocaleKeys.game_view_popup_continue_button.tr(),
              onPressed: widget.onContinue,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ];
}
