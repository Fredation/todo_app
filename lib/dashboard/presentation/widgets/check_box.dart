import 'package:flutter/material.dart';
import 'package:todo_app/config/app_colors.dart';

Container checkBox(bool isActive) {
  return Container(
    height: 32,
    width: 32,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: isActive ? AppColors.greenBorder : AppColors.blue,
        width: 1.5,
      ),
      color: isActive ? AppColors.green : AppColors.white,
    ),
    child: isActive
        ? const Icon(
            Icons.check,
            size: 18,
            color: AppColors.greenCheck,
          )
        : null,
  );
}
