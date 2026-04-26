// ignore_for_file: deprecated_member_use

import 'package:dev_portfolio/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.isMobile(context) ? 70 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.isMobile(context) ? 16 : 20,
      ),
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
          Flexible(
            flex: ResponsiveHelper.isMobile(context) ? 2 : 1,
            child: Text(
              '<𝓐𝓶𝓮𝓮𝓻 𝓗𝓪𝓶𝔃𝓪/>',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: ResponsiveHelper.isMobile(context) ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Navigation Menu - Responsive layout
          if (ResponsiveHelper.isDesktop(context))
            _buildDesktopNav()
          else if (ResponsiveHelper.isTablet(context))
            _buildTabletNav(context)
          else
            Spacer(), // Push menu to right on mobile
          // Mobile menu (right side) or Resume button
          if (ResponsiveHelper.isMobile(context))
            _buildMobileNav()
          else
            _buildResumeButton(context),
        ],
      ),
    );
  }

  Widget _buildDesktopNav() {
    return Flexible(
      flex: 3,
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.navItems.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return Obx(
                () => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: _buildNavItem(index, item, 14),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletNav(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...controller.navItems.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;
                  return Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: _buildNavItem(index, item, 12),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNav() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: AppColors.textPrimary, size: 24),
      color: AppColors.primaryColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColors.accentColor.withOpacity(0.3)),
      ),
      offset: Offset(0, 50),
      itemBuilder: (context) {
        List<PopupMenuEntry<String>> menuItems = [];

        // Add navigation items
        for (int i = 0; i < controller.navItems.length; i++) {
          String item = controller.navItems[i];
          menuItems.add(
            PopupMenuItem<String>(
              value: 'nav_$i',
              child: Obx(
                () => Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color:
                            controller.currentIndex.value == i
                                ? AppColors.accentColor
                                : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        color:
                            controller.currentIndex.value == i
                                ? AppColors.accentColor
                                : AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight:
                            controller.currentIndex.value == i
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        // Add divider
        menuItems.add(PopupMenuDivider());

        // Add resume item
        menuItems.add(
          PopupMenuItem<String>(
            value: 'resume',
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.description,
                    color: AppColors.accentColor,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'RESUME',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        return menuItems;
      },
      onSelected: (value) {
        if (value == 'resume') {
          controller.openResume();
        } else if (value.startsWith('nav_')) {
          int index = int.parse(value.split('_')[1]);
          controller.changeTab(index);
        }
      },
    );
  }

  Widget _buildNavItem(int index, String item, double fontSize) {
    return InkWell(
      onTap: () => controller.changeTab(index),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        constraints: BoxConstraints(minWidth: 60),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                controller.currentIndex.value == index
                    ? AppColors.accentColor
                    : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          item,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color:
                controller.currentIndex.value == index
                    ? AppColors.accentColor
                    : AppColors.textPrimary,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 100.0),
        child: ElevatedButton(
          onPressed: () => controller.openResume(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: AppColors.accentColor, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 16,
              vertical: 8,
            ),
            minimumSize: Size(isMobile ? 80 : 100, 36),
          ),
          child: FittedBox(
            child: Text(
              'RESUME',
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
