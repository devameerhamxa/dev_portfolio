// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class CustomAppBar extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: ResponsiveHelper.getPadding(context),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            '<Hamza/>',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Navigation Menu
          if (ResponsiveHelper.isDesktop(context))
            Row(
              children: [
                ...controller.navItems.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () => controller.changeTab(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  controller.currentIndex.value == index
                                      ? AppColors.accentColor
                                      : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              color:
                                  controller.currentIndex.value == index
                                      ? AppColors.accentColor
                                      : AppColors.textPrimary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(width: 20),
                // Resume Button
                ElevatedButton(
                  onPressed: () => controller.openResume(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: AppColors.accentColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'RESUME',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          else
            // Mobile Menu Button
            IconButton(
              onPressed: () => _showMobileMenu(context),
              icon: Icon(Icons.menu, color: AppColors.textPrimary),
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.secondaryColor,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...controller.navItems.asMap().entries.map((entry) {
                int index = entry.key;
                String item = entry.value;
                return Obx(
                  () => ListTile(
                    title: Text(
                      item,
                      style: TextStyle(
                        color:
                            controller.currentIndex.value == index
                                ? AppColors.accentColor
                                : AppColors.textPrimary,
                      ),
                    ),
                    onTap: () {
                      controller.changeTab(index);
                      Navigator.pop(context);
                    },
                  ),
                );
              }).toList(),
              ListTile(
                title: Text(
                  'RESUME',
                  style: TextStyle(color: AppColors.accentColor),
                ),
                onTap: () {
                  controller.openResume();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
