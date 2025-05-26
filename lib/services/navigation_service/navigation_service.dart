import 'package:flutter/material.dart';

abstract class NavigationService {
  void goBack({Uri? fallbackUri});
  void pop<T>({T? data});
  void push(String uri);
  Future<void> showModal<T>(Widget widget);
  void replaceWith(Uri uri);
  void replaceWithNamed(Uri uri);
  void showSnackBar(String message);
  Future<T?> showPopup<T>(Widget popup);
}
