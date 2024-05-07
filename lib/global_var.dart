import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/config/router/router.dart';

final GetIt injector = GetIt.I;

get screenWidth {
  return MediaQuery.of(navigatorKey.currentContext!).size.width;
}

get screenHeight {
  return MediaQuery.of(navigatorKey.currentContext!).size.height;
}
