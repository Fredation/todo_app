import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/config/app_colors.dart';

class TodoButton extends StatelessWidget {
  final String text;

  final void Function()? onPressed;

  final bool loading;
  const TodoButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading
          ? null
          : () {
              HapticFeedback.lightImpact();
              onPressed!();
            },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.primary,
          border: Border.all(
            color: AppColors.button,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: const Color(0xffA8B5DE).withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 18,
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
    );
  }
}
