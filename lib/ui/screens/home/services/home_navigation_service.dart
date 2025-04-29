import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeNavigationService {
  void push(String uri);
  TaskEither<Object, Option<T>> showModal<T>(Widget widget);
}
