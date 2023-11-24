import 'package:beercules/common/constants.dart';
import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BcDialog extends StatelessWidget {
  final VoidCallback _onConfirmPressed;
  final VoidCallback _onCancelPressed;
  final String _confirmTextResource;
  final String _headerResource;
  final String _descriptionResource;
  final String _declineTextResource;

  const BcDialog({
    required final void Function() onConfirmPressed,
    required final void Function() onCancelPressed,
    required final String confirmTextResource,
    required final String headerResource,
    required final String descriptionResource,
    required final String declineTextResource,
    super.key,
  })  : _declineTextResource = declineTextResource,
        _descriptionResource = descriptionResource,
        _headerResource = headerResource,
        _confirmTextResource = confirmTextResource,
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
                          _headerResource.tr(),
                          style: TextStyles.header2,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        _descriptionResource.tr(),
                        style: TextStyles.body1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildDialogButtons(
                        onConfirmPressed: _onConfirmPressed,
                        onCancelPressed: _onCancelPressed,
                        confirmTextResource: _confirmTextResource,
                        declineTextResource: _declineTextResource,
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
    required final String confirmTextResource,
    required final String declineTextResource,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: BcButton(
              onPressed: onConfirmPressed,
              textResource: confirmTextResource,
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: BcButton(
              onPressed: onCancelPressed,
              textResource: declineTextResource,
            ),
          ),
        ],
      );
}
