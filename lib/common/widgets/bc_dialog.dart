import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BcDialog extends StatelessWidget {
  const BcDialog({
    required this.onConfirmPressed,
    required this.onCancelPressed,
    required this.confirmTextResource,
    required this.headerResource,
    required this.descriptionResource,
    required this.declineTextResource,
    super.key,
  });
  final VoidCallback onConfirmPressed;
  final VoidCallback onCancelPressed;
  final String confirmTextResource;
  final String headerResource;
  final String descriptionResource;
  final String declineTextResource;

  @override
  Widget build(final BuildContext context) => Material(
        color: Colors.black.withAlpha(100),
        child: Padding(
          padding: const EdgeInsets.all(32),
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
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          headerResource.tr(),
                          style: TextStyles.header2,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        descriptionResource.tr(),
                        style: TextStyles.body1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildDialogButtons(
                        onConfirmPressed: onConfirmPressed,
                        onCancelPressed: onCancelPressed,
                        confirmTextResource: confirmTextResource,
                        declineTextResource: declineTextResource,
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
  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<VoidCallback>.has(
          'onCancelPressed',
          onCancelPressed,
        ),
      )
      ..add(
        ObjectFlagProperty<VoidCallback>.has(
          'onConfirmPressed',
          onConfirmPressed,
        ),
      )
      ..add(StringProperty('confirmTextResource', confirmTextResource))
      ..add(StringProperty('headerResource', headerResource))
      ..add(StringProperty('descriptionResource', descriptionResource))
      ..add(StringProperty('declineTextResource', declineTextResource));
  }
}
