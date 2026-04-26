// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controllers/portfolio_controller.dart';
import '../utils/app_colors.dart';
import '../utils/responsive_helper.dart';

class ContactSection extends StatelessWidget {
  final PortfolioController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: ResponsiveHelper.getPadding(context),
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(
            'Get in Touch',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: ResponsiveHelper.isMobile(context) ? 36 : 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Let\'s build something together :)',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
          SizedBox(height: 60),
          _buildContactCards(context),
          SizedBox(height: 40),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildContactCards(BuildContext context) {
    return ResponsiveHelper.isMobile(context)
        ? _buildMobileContactCards()
        : _buildDesktopContactCards();
  }

  Widget _buildDesktopContactCards() {
    return Row(
      children: [
        Expanded(
          child: _buildContactCard(
            icon: FontAwesomeIcons.locationDot,
            title: 'Location',
            subtitle: 'Islamabad, PK',
            onTap: null,
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: _buildContactCard(
            icon: FontAwesomeIcons.phone,
            title: 'Phone/WhatsApp',
            subtitle: '+92-308 8116237',
            onTap: () => controller.makePhoneCall(),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          child: _buildContactCard(
            icon: FontAwesomeIcons.envelope,
            title: 'Email',
            subtitle: 'ameerhamxa1811@gmail.com',
            onTap: () => controller.sendEmail(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContactCards() {
    return Column(
      children: [
        _buildContactCard(
          icon: FontAwesomeIcons.locationDot,
          title: 'Location',
          subtitle: 'Islamabad, PK',
          onTap: null,
        ),
        SizedBox(height: 20),
        _buildContactCard(
          icon: FontAwesomeIcons.phone,
          title: 'Phone/WhatsApp',
          subtitle: '+92-308 8116237',
          onTap: () => controller.makePhoneCall(),
        ),
        SizedBox(height: 20),
        _buildContactCard(
          icon: FontAwesomeIcons.envelope,
          title: 'Email',
          subtitle: 'ameerhamxa1811@gmail.com',
          onTap: () => controller.sendEmail(),
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor:
          onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
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
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: FaIcon(icon, color: Colors.white, size: 32),
                ),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Developed in ',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              Text('💙', style: TextStyle(fontSize: 16)),
              Text(
                ' with ',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
              ),
              InkWell(
                onTap: () => controller.launchURL('https://flutter.dev'),
                child: Text(
                  'Flutter',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: AppColors.cardColor, thickness: 1),
          SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} Ameer Hamza. All rights reserved.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          _buildSocialIcons(),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon(FontAwesomeIcons.facebookF, 'facebook'),
        _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'linkedin'),
        _buildSocialIcon(FontAwesomeIcons.github, 'github'),
        // _buildSocialIcon(FontAwesomeIcons.xTwitter, 'twitter'),
        _buildSocialIcon(FontAwesomeIcons.instagram, 'instagram'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String platform) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => controller.openSocialMedia(platform),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppColors.accentColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: FaIcon(icon, color: AppColors.textPrimary, size: 18),
        ),
      ),
    );
  }
}
