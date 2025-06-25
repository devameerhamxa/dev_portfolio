import 'package:dev_portfolio/widgets/about_section.dart';
import 'package:dev_portfolio/widgets/contact_section.dart';
import 'package:dev_portfolio/widgets/custom_app_bar.dart';
import 'package:dev_portfolio/widgets/home_section.dart';
import 'package:dev_portfolio/widgets/project_section.dart';
import 'package:dev_portfolio/widgets/services_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';

class PortfolioView extends StatelessWidget {
  final PortfolioController controller = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                return IndexedStack(
                  index: controller.currentIndex.value,
                  children: [
                    HomeSection(),
                    AboutSection(),
                    ServicesSection(),
                    ProjectsSection(),
                    ContactSection(),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
