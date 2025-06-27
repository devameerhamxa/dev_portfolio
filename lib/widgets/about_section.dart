// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class AboutSection extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'About Me',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: ResponsiveHelper.isMobile(context) ? 36 : 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Get to know me :)',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          SizedBox(height: 60),
          ResponsiveHelper.isMobile(context)
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                'assets/images/about_photo.jpg',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.cardColor,
                    child: Icon(
                      Icons.person,
                      size: 150,
                      color: AppColors.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 60),
        Expanded(flex: 3, child: _buildAboutContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/about_photo.jpg',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.cardColor,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: AppColors.textSecondary,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 40),
        _buildAboutContent(context),
      ],
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "I'm Ameer Hamza, a Flutter Developer, Technical blog writer and UI/UX Designer.",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "I'm a fresh graduate with Computer Science as Majors from COMSATS University Islamabad. I have been working with Flutter for the past 2 years and have developed multiple applications for both Android and iOS platforms. I have a keen interest in UI/UX designing and have been working on it for the past 3 years. I have also been writing technical blogs for the past 2 years and have been a part of multiple technical writing communities.",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.8,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Technologies I have worked with:',
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        _buildTechStack(),
        SizedBox(height: 40),
        _buildPersonalInfo(),
        SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => controller.openResume(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentColor,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'RESUME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 20),
            _buildBadge('assets/images/flutter_badge.png'),
            SizedBox(width: 10),
            _buildBadge('assets/images/firebase_badge.png'),
            SizedBox(width: 10),
            _buildBadge('assets/images/github_badge.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildTechStack() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children:
          controller.technologies.map((tech) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.accentColor.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.accentColor,
                    size: 12,
                  ),
                  SizedBox(width: 8),
                  Text(
                    tech,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildPersonalInfo() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Name:', 'Ameer Hamza'),
              SizedBox(height: 10),
              _buildInfoRow('Age:', '22'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Email:', 'hamza.6.shakeel@gmail.com'),
              SizedBox(height: 10),
              _buildInfoRow('From:', 'Islamabad, PK'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        imagePath,
        errorBuilder: (context, error, stackTrace) {
          return Icon(Icons.code, color: AppColors.accentColor);
        },
      ),
    );
  }
}
