import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/dashboard/model/task.dart';
import 'package:todo_app/dashboard/presentation/home_page.dart';
import 'package:todo_app/dashboard/presentation/manage_task.dart';

/// Main router for TodoApp
///
/// ! Pay attention to the order of routes.
/// Create:  example/create
/// View:    example/:eid
/// Edit:    example/:eid/edit
/// where :edit means example entity id.
///
/// ! Note about parameters
/// Router keeps parameters in global map. It means that if you create route
/// organization/:id and organization/:id/department/:id. Department id will
///  override organization id. So use :oid and :did instead of :id
/// Also router does not provide option to set regex for parameters.
/// If you put - example/:eid before - example/create for route - example/create
/// will be called route - example/:eid
///
///
final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/${HomePage.routeName}',
      name: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/${ManageTaskPage.routeName}',
      name: ManageTaskPage.routeName,
      builder: (context, state) => ManageTaskPage(
        taskModel: state.extra as TaskModel?,
      ),
    ),
  ],
  initialLocation: '/${HomePage.routeName}',
  observers: [routeObserver],
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
);

/// Route observer to use with RouteAware
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
