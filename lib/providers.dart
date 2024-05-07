import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/dashboard/states/task_cubit.dart';
import 'package:todo_app/global_var.dart';

List<BlocProvider> initializeProviders() {
  return [
    BlocProvider<TaskCubit>(create: (context) {
      return injector<TaskCubit>();
    }),
  ];
}
