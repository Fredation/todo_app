import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/app_colors.dart';
import 'package:todo_app/dashboard/model/task.dart';
import 'package:todo_app/dashboard/presentation/widgets/button.dart';
import 'package:todo_app/dashboard/presentation/widgets/input_field.dart';
import 'package:todo_app/dashboard/states/task_cubit.dart';

class ManageTaskPage extends StatefulWidget {
  static const String routeName = 'manage_task';
  const ManageTaskPage({super.key, required this.taskModel});

  final TaskModel? taskModel;

  @override
  State<ManageTaskPage> createState() => _ManageTaskPageState();
}

class _ManageTaskPageState extends State<ManageTaskPage> {
  final controller = TextEditingController();

  @override
  void initState() {
    if (widget.taskModel != null) {
      controller.text = widget.taskModel!.title;
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.watch<TaskCubit>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(
            widget.taskModel == null ? "Add New Task" : "Edit Task",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              shadows: [
                const Shadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          leading: SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Name",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(height: 15),
              TodoInputField(controller: controller),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TodoButton(
                text: "Done",
                onPressed: () {
                  if (widget.taskModel == null) {
                    taskCubit.addTask(
                        task: controller.text, id: taskCubit.tasks.length + 1);
                    context.pop();
                  } else {
                    taskCubit.editTask(
                        newTask: controller.text, id: widget.taskModel!.id);
                    context.pop();
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
