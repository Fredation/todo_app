import 'package:flutter/material.dart';
import 'package:todo_app/config/app_colors.dart';
import 'package:todo_app/config/img_assets.dart';
import 'package:todo_app/global_var.dart';

Positioned adCard(BuildContext context) {
  return Positioned(
    top: 123 + kToolbarHeight,
    left: 0,
    child: Container(
      height: 116,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: AppColors.lemon,
        border: Border.all(
          color: AppColors.lemonBorder,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImgAssets.cup,
            height: 41,
            width: 53,
          ),
          const SizedBox(width: 27),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Go Pro (No Ads)",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.blue,
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "No fuss, no ads, for only \$1 a \nmonth",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.blue,
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
