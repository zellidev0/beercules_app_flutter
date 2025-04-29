import 'package:flutter/material.dart';

abstract interface class GeneralNavigationService {
  void goBack({Uri? fallbackUri});
  void pop<T>({T? data});
  void replaceWith(Uri uri);
  void replaceWithNamed(Uri uri);
  void showSnackBar(String message);
  Future<T?> showPopup<T>(Widget popup);
}
