import 'package:beercules/common/constants.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:flutter/material.dart';

// class BeerculesGameDialog extends StatefulWidget {
//   final int? activeGameRemainingCards;
//   final int? customGameCardsAmount;
//   final int defaultGameCardsAmount;
//   final VoidCallback onContinue;
//   final void Function({required bool isCustomGame}) onNewGame;
//   const BeerculesGameDialog({
//     required this.activeGameRemainingCards,
//     required this.defaultGameCardsAmount,
//     required this.customGameCardsAmount,
//     required this.onContinue,
//     required this.onNewGame,
//     super.key,
//   });
//
//   @override
//   State<BeerculesGameDialog> createState() => _BeerculesGameDialogState();
// }
//
// class _BeerculesGameDialogState extends State<BeerculesGameDialog> {
//   bool isCustomGame = false;

class BeerculesDialog extends StatelessWidget {
  final VoidCallback _onConfirmPressed;
  final VoidCallback _onCancelPressed;
  final String _confirmText;
  final String _headerText;
  final String _descriptionText;
  final String _declineText;

  const BeerculesDialog({
    required void Function() onConfirmPressed,
    required void Function() onCancelPressed,
    required String confirmText,
    required String headerText,
    required String descriptionText,
    required String declineText,
    super.key,
  }) : _declineText = declineText,
       _descriptionText = descriptionText,
       _headerText = headerText,
       _confirmText = confirmText,
       _onCancelPressed = onCancelPressed,
       _onConfirmPressed = onConfirmPressed;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black.withAlpha(100),
    child: Padding(
      padding: Constants.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withAlpha(255),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: Constants.pagePadding,
              child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: <Widget>[
                //                 AutoSizeText(
                //                 LocaleKeys.game_view_popup_header.tr(),
                //                 style: TextStyles.header2,
                //               ),
                //     if (widget.activeGameRemainingCards != null &&
                // widget.activeGameRemainingCards! > 0)
                // ...buildContinue(
                // activeGameRemainingCards:
                // widget.activeGameRemainingCards!,
                // ),
                // if (widget.customGameCardsAmount != null)
                // _buildCustomOrDefaultSwitch(),
                // Center(
                // child: SizedBox(
                // width: double.infinity,
                // child: BeerculesButton(
                // text: widget.activeGameRemainingCards != null
                // ? LocaleKeys
                //     .game_view_popup_custom_or_default_button_active_game_exists
                //     .tr()
                //     : LocaleKeys
                //     .game_view_popup_custom_or_default_button_lets_go
                //     .tr(),
                // onPressed: () => widget.onNewGame(
                // isCustomGame: isCustomGame,
                // ),
                // ),
                // ),
                // ),
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(_headerText, style: TextStyles.header2),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    _descriptionText,
                    style: TextStyles.body1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _buildDialogButtons(
                    onConfirmPressed: _onConfirmPressed,
                    onCancelPressed: _onCancelPressed,
                    confirmText: _confirmText,
                    declineText: _declineText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Row _buildDialogButtons({
    required final VoidCallback onConfirmPressed,
    required final VoidCallback onCancelPressed,
    required final String confirmText,
    required final String declineText,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        child: BeerculesButton(onPressed: onConfirmPressed, text: confirmText),
      ),
      const SizedBox(width: 32),
      Expanded(
        child: BeerculesButton(onPressed: onCancelPressed, text: declineText),
      ),
    ],
  );
}
