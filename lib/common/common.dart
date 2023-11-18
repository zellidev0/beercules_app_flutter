import 'package:beercules/common/widgets/bc_button.dart';
import 'package:beercules/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  required final VoidCallback? onPressed,
  required final String textResource,
}) =>
    BcButton(
      onPressed: onPressed,
      child: Text(
        textResource,
        style: TextStyles.body2,
      ).tr(),
    );

Widget buildIconButtonWithText({
  required final VoidCallback onPressed,
  required final String textResource,
  required final IconData icon,
}) =>
    BcButton(
      onPressed: onPressed,
      child: Text(
        textResource,
        style: TextStyles.body1,
      ).tr(),
    );
