import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeNavigationService {
  void push(final String uri);
  TaskEither<Object, Option<T>> showModal<T>(final Widget widget);
}
