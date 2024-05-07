import 'package:flutter/material.dart';
import 'package:todo_app/app_initialisation.dart';
import 'package:todo_app/config/router/router.dart';
import 'package:todo_app/config/theme.dart';

/// Main test app class
class TodoApp extends StatefulWidget {
  /// Default constructor for test app
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  void didChangeDependencies() {
    AppInitialisation.postRun(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "TodoApp",
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      
    );
  }
}
