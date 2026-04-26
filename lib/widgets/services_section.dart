// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class ServicesSection extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'What I can do?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: ResponsiveHelper.isMobile(context) ? 36 : 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'I may not be perfect but surely I\'m of some use :)',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          SizedBox(height: 60),
          _buildServicesGrid(context),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    int crossAxisCount =
        ResponsiveHelper.isMobile(context)
            ? 1
            : ResponsiveHelper.isTablet(context)
            ? 2
            : 3;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: ResponsiveHelper.isMobile(context) ? 1.5 : 1.2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: controller.services.length,
      itemBuilder: (context, index) {
        final service = controller.services[index];
        return _buildServiceCard(service, index);
      },
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.accentColor.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            _buildServiceIcon(service['icon']),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                service['title'],
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                service['description'],
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(String iconType) {
    IconData iconData;

    switch (iconType) {
      case 'mobile':
        iconData = FontAwesomeIcons.mobileAlt;
        break;
      case 'design':
        iconData = FontAwesomeIcons.paintBrush;
        break;
      case 'github':
        iconData = FontAwesomeIcons.github;
        break;
      default:
        iconData = FontAwesomeIcons.code;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: AppColors.accentColor.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Center(
        child: FaIcon(iconData, color: AppColors.accentColor, size: 32),
      ),
    );
  }
}
