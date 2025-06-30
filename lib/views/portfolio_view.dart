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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(AppColors.accentColor),
                thickness: WidgetStateProperty.all(8.0),
                radius: Radius.circular(10),
              ),
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    Container(
                      key: controller.sectionKeys[0],
                      child: HomeSection(),
                    ),
                    Container(
                      key: controller.sectionKeys[1],
                      child: AboutSection(),
                    ),
                    Container(
                      key: controller.sectionKeys[2],
                      child: ServicesSection(),
                    ),
                    Container(
                      key: controller.sectionKeys[3],
                      child: ProjectsSection(),
                    ),
                    Container(
                      key: controller.sectionKeys[4],
                      child: ContactSection(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
