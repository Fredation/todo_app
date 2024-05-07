import 'package:todo_app/dashboard/states/task_cubit.dart';
import 'package:todo_app/global_var.dart';

Future<void> registerDependencies() async {
  //cubits
  injector.registerFactory(
    () => TaskCubit(),
  );
}
