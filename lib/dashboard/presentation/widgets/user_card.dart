import 'package:flutter/material.dart';
import 'package:todo_app/config/app_colors.dart';
import 'package:todo_app/config/img_assets.dart';
import 'package:todo_app/global_var.dart';

Positioned userCard(BuildContext context) {
  return Positioned(
    top: 0,
    left: 0,
    child: Container(
      height: 123 + kToolbarHeight,
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(32, 19 + kToolbarHeight, 32, 0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Image.asset(
              ImgAssets.face,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(width: 21),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Aneke Frederick",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "anekefrederick@gmail.com",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
