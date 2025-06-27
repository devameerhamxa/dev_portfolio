import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioController extends GetxController {
  var currentIndex = 0.obs;
  var hoveredProjectIndex = (-1).obs;

  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // HOME
    GlobalKey(), // ABOUT
    GlobalKey(), // SERVICES
    GlobalKey(), // PROJECTS
    GlobalKey(), // CONTACT
  ];

  final List<String> navItems = [
    'HOME',
    'ABOUT',
    'SERVICES',
    'PROJECTS',
    'CONTACT',
  ];

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Awesome Snackbar',
      'description':
          'A Flutter package for beautiful and customizable snackbars with various animations and styles.',
      'image': 'assets/images/snackbar_project.png',
      'github': 'https://github.com/yourusername/awesome-snackbar',
      'tags': ['Flutter', 'Package', 'UI/UX'],
    },
    {
      'title': 'Holy Qur\'an App',
      'description':
          'A comprehensive Quran reading app with translation, search, and bookmarking features.',
      'image': 'assets/images/quran_app.png',
      'github': 'https://github.com/yourusername/holy-quran-app',
      'tags': ['Flutter', 'Mobile', 'Islamic'],
    },
    {
      'title': 'MedKit - Pharmacy App',
      'description':
          'A pharmacy management system with inventory tracking and prescription management.',
      'image': 'assets/images/medkit_app.png',
      'github': 'https://github.com/yourusername/medkit-app',
      'tags': ['Flutter', 'Healthcare', 'Management'],
    },
    {
      'title': 'Here I Am - Location App',
      'description':
          'A location-based social app for sharing your current location with friends and family.',
      'image': 'assets/images/location_app.png',
      'github': 'https://github.com/yourusername/here-i-am',
      'tags': ['Flutter', 'Location', 'Social'],
    },
    {
      'title': 'COVID-19 Tracker',
      'description':
          'Stay updated with latest COVID-19 statistics and safety guidelines.',
      'image': 'assets/images/covid_app.png',
      'github': 'https://github.com/yourusername/covid-tracker',
      'tags': ['Flutter', 'Health', 'API'],
    },
  ];

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Mobile Development',
      'description': 'Cross-platform mobile app development using Flutter',
      'icon': 'mobile',
    },
    {
      'title': 'UI/UX Design',
      'description': 'Beautiful and intuitive user interface design',
      'icon': 'design',
    },
    {
      'title': 'Rapid Prototyping',
      'description': 'Quick prototyping and MVP development',
      'icon': 'prototype',
    },
    {
      'title': 'Technical Writing',
      'description': 'Technical blog writing and documentation',
      'icon': 'writing',
    },
    {
      'title': 'Open Source - GitHub',
      'description': 'Contributing to open source projects',
      'icon': 'github',
    },
  ];

  final List<String> technologies = [
    'Flutter',
    'Dart',
    'Firebase',
    'Python',
    'dart_frog',
    'jaspr',
    'nodejs',
    'express',
  ];

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    currentIndex.value = index;
    scrollToSection(index);
  }

  void scrollToSection(int index) {
    if (index >= 0 && index < sectionKeys.length) {
      final context = sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void setHoveredProject(int index) {
    hoveredProjectIndex.value = index;
  }

  void clearHoveredProject() {
    hoveredProjectIndex.value = -1;
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> openResume() async {
    // Replace with your Google Drive resume link
    const String resumeUrl =
        'https://drive.google.com/file/d/your-resume-file-id/view';
    await launchURL(resumeUrl);
  }

  Future<void> openGitHub(String repoUrl) async {
    await launchURL(repoUrl);
  }

  Future<void> sendEmail() async {
    const String email = 'mailto:hamza.6.shakeel@gmail.com';
    await launchURL(email);
  }

  Future<void> makePhoneCall() async {
    const String phone = 'tel:+923460159889';
    await launchURL(phone);
  }

  Future<void> openSocialMedia(String platform) async {
    String url = '';
    switch (platform) {
      case 'github':
        url = 'https://github.com/yourusername';
        break;
      case 'linkedin':
        url = 'https://linkedin.com/in/yourusername';
        break;
      case 'facebook':
        url = 'https://facebook.com/yourusername';
        break;
      case 'twitter':
        url = 'https://twitter.com/yourusername';
        break;
      case 'instagram':
        url = 'https://instagram.com/yourusername';
        break;
      case 'medium':
        url = 'https://medium.com/@yourusername';
        break;
    }
    if (url.isNotEmpty) {
      await launchURL(url);
    }
  }
}
