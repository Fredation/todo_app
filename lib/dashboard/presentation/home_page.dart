import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/app_colors.dart';
import 'package:todo_app/dashboard/presentation/manage_task.dart';
import 'package:todo_app/dashboard/presentation/widgets/ad_card.dart';
import 'package:todo_app/dashboard/presentation/widgets/task_card.dart';
import 'package:todo_app/dashboard/presentation/widgets/user_card.dart';
import 'package:todo_app/dashboard/states/task_cubit.dart';
import 'package:todo_app/global_var.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final taskCubit = context.watch<TaskCubit>();
    return Scaffold(
      body: Stack(
        children: [
          userCard(context),
          adCard(context),
          Positioned(
            top: 123 + kToolbarHeight,
            right: 24,
            height: 71,
            width: 66,
            child: Container(
              color: AppColors.blue,
              child: Center(
                child: Text(
                  "\$1",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.gold,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 239 + kToolbarHeight,
            left: 0,
            child: Container(
              height: screenHeight,
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final task = taskCubit.tasks[index];
                  return TaskCard(taskModel: task);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: taskCubit.tasks.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () => context.pushNamed(ManageTaskPage.routeName, extra: null),
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blueBorder,
          ),
          child: Center(
            child: Text(
              "+",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.white,
                fontSize: 36,
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    blurRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
