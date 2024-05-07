import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/app_initialisation.dart';
import 'package:todo_app/providers.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    await AppInitialisation.preRun();

    runApp(
      MultiBlocProvider(
        providers: initializeProviders(),
        child: const TodoApp(),
      ),
    );
  }, (onError, stackTrace) {
    log(onError.toString(), stackTrace: stackTrace);
  });
}
