import 'package:dev_portfolio/utils/app_colors.dart';
import 'package:dev_portfolio/views/portfolio_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dev_portfolio/controllers/portfolio_controller.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ameer Hamza - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
      ),
      home: PortfolioView(),
      initialBinding: BindingsBuilder(() {
        Get.put(PortfolioController());
      }),
    );
  }
}
