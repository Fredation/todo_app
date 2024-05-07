import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/app_colors.dart';
import 'package:todo_app/dashboard/model/task.dart';
import 'package:todo_app/dashboard/presentation/manage_task.dart';
import 'package:todo_app/dashboard/presentation/widgets/check_box.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  const TaskCard({super.key, required this.taskModel});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(23, 23, 19, 23),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.cardBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: checkBox(isChecked),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Text(
              widget.taskModel.title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isChecked ? AppColors.grey : AppColors.blue,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                  ),
            ),
          ),
          InkWell(
            onTap: () => context.pushNamed(ManageTaskPage.routeName,
                extra: widget.taskModel),
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.blue,
                  width: 1,
                ),
              ),
              child: Text(
                "Edit",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
