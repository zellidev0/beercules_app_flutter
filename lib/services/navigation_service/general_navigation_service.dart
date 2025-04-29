import 'package:flutter/material.dart';

abstract interface class GeneralNavigationService {
  void goBack({final Uri? fallbackUri});
  void pop<T>({final T? data});
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
  void showSnackBar(final String message);
  Future<T?> showPopup<T>(final Widget popup);
}
