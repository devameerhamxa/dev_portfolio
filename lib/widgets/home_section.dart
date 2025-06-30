// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class HomeSection extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.getPadding(context),
      child:
          ResponsiveHelper.isMobile(context)
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'WELCOME TO MY PORTFOLIO',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('👋', style: TextStyle(fontSize: 24)),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Ameer',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 72,
                  fontWeight: FontWeight.w300,
                  height: 0.9,
                ),
              ),
              Text(
                'Hamza',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  height: 0.9,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.arrow_forward, color: AppColors.accentColor),
                  SizedBox(width: 10),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flutter Enthusiast',
                        textStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'Mobile Application Developer',
                        textStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                      TyperAnimatedText(
                        'UI/UX Designer',
                        textStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                    pause: Duration(milliseconds: 1000),
                  ),
                ],
              ),
              SizedBox(height: 40),
              _buildSocialIcons(),
            ],
          ),
        ),
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
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/profile_photo.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
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
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/profile_photo.png',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO MY PORTFOLIO',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: 5),
            Text('👋', style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Ameer',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 48,
            fontWeight: FontWeight.w300,
            height: 0.9,
          ),
        ),
        Text(
          'Hamza',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 0.9,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward, color: AppColors.accentColor),
            SizedBox(width: 10),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Flutter Enthusiast',
                  textStyle: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              pause: Duration(milliseconds: 1000),
            ),
          ],
        ),
        SizedBox(height: 40),
        _buildSocialIcons(),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment:
          ResponsiveHelper.isMobile(Get.context!)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        _buildSocialIcon(FontAwesomeIcons.facebookF, 'facebook'),
        _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'linkedin'),
        _buildSocialIcon(FontAwesomeIcons.github, 'github'),
        _buildSocialIcon(FontAwesomeIcons.instagram, 'instagram'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String platform) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () => controller.openSocialMedia(platform),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: FaIcon(icon, color: AppColors.textPrimary, size: 20),
        ),
      ),
    );
  }
}
