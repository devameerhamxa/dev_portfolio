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
      'title': 'Tic-Tac-Toe Game',
      'description':
          'A simple yet addictive Tic Tac Toe game built with Flutter & AI Agent.',
      'image': 'assets/images/splash_logo.jpg',
      'github': 'https://github.com/devameerhamxa/tic_tac_toa-with-AI_agent',
      'tags': ['Flutter', 'Ai-Game', 'UI/UX'],
    },
    {
      'title': 'Rent-a-Car App',
      'description':
          'A car rental app that allows users to book cars online with ease.',
      'image': 'assets/images/rent_car.jpg',
      'github': 'https://github.com/devameerhamxa/Rent-a-Car',
      'tags': ['Flutter', 'Mobile', 'UI/UX'],
    },
    {
      'title': 'Kitchen Recipes App',
      'description':
          'A recipe app that provides a collection of delicious kitchen recipes.',
      'image': 'assets/images/recipe.jpg',
      'github': 'https://github.com/devameerhamxa/Kitchen-Recipes',
      'tags': ['Flutter', 'Mobile', 'UI/UX'],
    },
    {
      'title': 'E-commerce App',
      'description':
          'A complete e-commerce app with product listings, cart, and checkout features.',
      'image': 'assets/images/estore.jpg',
      'github': 'https://github.com/devameerhamxa/E_store',
      'tags': ['Flutter', 'Mobile', 'UI/UX'],
    },
  ];

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Mobile App Development',
      'description': 'Cross-platform mobile app development using Flutter/Dart',
      'icon': 'mobile',
    },
    {
      'title': 'UI/UX Design',
      'description': 'Beautiful and intuitive user interface design',
      'icon': 'design',
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
    'REST APIs',
    'JavaScript',
    'Jasper',
    'Nodejs',
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
        'https://drive.google.com/file/d/1_bqGZm8YzolZkhdVR8gGgRNcLnr_96X6/view?usp=sharing';
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
        url = 'https://github.com/devameerhamxa';
        break;
      case 'linkedin':
        url = 'https://www.linkedin.com/in/ameer-hamza-97785a27b/';
        break;
      case 'facebook':
        url = 'https://www.facebook.com/ameer.hamxa.58152';
        break;
      case 'instagram':
        url = 'https://www.instagram.com/ameer_hamxaaa/';
        break;
    }
    if (url.isNotEmpty) {
      await launchURL(url);
    }
  }
}
