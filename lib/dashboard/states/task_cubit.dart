import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/config/failure.dart';
import 'package:todo_app/dashboard/model/task.dart';

part 'task_cubit.freezed.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  List<TaskModel> tasks = [];

  void addTask({required String task, required int id}) {
    List<TaskModel> tempTasks = [...tasks];
    tempTasks.add(TaskModel(title: task, id: id));
    tasks = tempTasks;
    emit(state.copyWith(data: tasks));
  }

  void editTask({required int id, required String newTask}) {
    List<TaskModel> tempTasks = [...tasks];
    int index = tempTasks.indexWhere((element) => element.id == id);
    tempTasks.removeWhere((element) => element.id == id);
    tempTasks.insert(index, TaskModel(title: newTask, id: id));
    tasks = tempTasks;
    emit(state.copyWith(data: tasks));
  }
}

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default(false) isLoading,
    Failure? error,
    dynamic data,
  }) = _TaskState;
}
