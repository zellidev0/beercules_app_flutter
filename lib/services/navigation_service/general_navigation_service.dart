import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GeneralNavigationService {
  void goBack({final Uri? fallbackUri});
  void pop<T>({final T? data});
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
  void showSnackBar(final String message);
  TaskEither<Object, Option<T>> showPopup<T>(
    final Widget popup, {
    final bool canBePoppedViaBackGesture,
  });
}
