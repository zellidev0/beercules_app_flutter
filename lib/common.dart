import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  required VoidCallback onPressed,
  required String textResource,
}) =>
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(textResource).tr(),
    );
