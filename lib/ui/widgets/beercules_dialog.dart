import 'package:beercules/common/constants.dart';
import 'package:beercules/common/theme.dart';
import 'package:beercules/ui/widgets/beercules_button.dart';
import 'package:flutter/material.dart';

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
  })  : _declineText = declineText,
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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: Constants.pagePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          _headerText,
                          style: TextStyles.header2,
                        ),
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
    required VoidCallback onConfirmPressed,
    required VoidCallback onCancelPressed,
    required String confirmText,
    required String declineText,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: BeerculesButton(
              onPressed: onConfirmPressed,
              text: confirmText,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: BeerculesButton(
              onPressed: onCancelPressed,
              text: declineText,
            ),
          ),
        ],
      );
}
