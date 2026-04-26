// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class ProjectsSection extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Portfolio',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: ResponsiveHelper.isMobile(context) ? 36 : 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Here are few samples of my work :)',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          SizedBox(height: 60),
          _buildProjectsGrid(context),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    int crossAxisCount = ResponsiveHelper.isMobile(context) ? 1 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: ResponsiveHelper.isMobile(context) ? 1.3 : 1.4,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: controller.projects.length,
      itemBuilder: (context, index) {
        final project = controller.projects[index];
        return _buildProjectCard(project, index, context);
      },
    );
  }

  Widget _buildProjectCard(
    Map<String, dynamic> project,
    int index,
    BuildContext context,
  ) {
    return Obx(() {
      bool isHovered = controller.hoveredProjectIndex.value == index;

      return MouseRegion(
        onEnter: (_) => controller.setHoveredProject(index),
        onExit: (_) => controller.clearHoveredProject(),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => controller.openGitHub(project['github']),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isHovered ? 0.3 : 0.1),
                  blurRadius: isHovered ? 20 : 10,
                  offset: Offset(0, isHovered ? 10 : 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Project Image
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      project['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.cardColor,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 60,
                                  color: AppColors.textSecondary,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  project['title'],
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Hover Overlay
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: isHovered ? 1.0 : 0.0,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project['title'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              project['description'],
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                                height: 1.4,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 15),
                            Wrap(
                              spacing: 8,
                              runSpacing: 5,
                              children:
                                  (project['tags'] as List<String>).map((tag) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.accentColor
                                            .withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        tag,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                            SizedBox(height: 15),
                            InkWell(
                              onTap:
                                  () =>
                                      controller.openGitHub(project['github']),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'See More',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
