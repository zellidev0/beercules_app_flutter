import 'package:beercules/common/constants.dart';
import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/theme.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback _onConfirmPressed;
  final VoidCallback _onCancelPressed;
  final String _confirmText;
  final String _headerText;
  final String _descriptionText;
  final String _declineText;

  const CustomDialog({
    required final void Function() onConfirmPressed,
    required final void Function() onCancelPressed,
    required final String confirmText,
    required final String headerText,
    required final String descriptionText,
    required final String declineText,
    super.key,
  })  : _declineText = declineText,
        _descriptionText = descriptionText,
        _headerText = headerText,
        _confirmText = confirmText,
        _onCancelPressed = onCancelPressed,
        _onConfirmPressed = onConfirmPressed;

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
                  color:
                      Theme.of(context).colorScheme.background.withAlpha(255),
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
    required final VoidCallback onConfirmPressed,
    required final VoidCallback onCancelPressed,
    required final String confirmText,
    required final String declineText,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: BcButton(
              onPressed: onConfirmPressed,
              text: confirmText,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: BcButton(
              onPressed: onCancelPressed,
              text: declineText,
            ),
          ),
        ],
      );
}
