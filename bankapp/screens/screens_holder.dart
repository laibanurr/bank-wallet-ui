import 'package:assignment/bankapp/screens/bank_onboarding_screen.dart';
import 'package:assignment/bankapp/screens/check_out_screen.dart';
import 'package:assignment/bankapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ScreensHolder extends StatefulWidget {
  const ScreensHolder({super.key});

  @override
  State<ScreensHolder> createState() => _ScreensHolderState();
}

class _ScreensHolderState extends State<ScreensHolder> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: [
        BankOnboardingScreen(controller: _pageController,),
        DashboardScreen(),
        CheckOutScreen(),
      ],
    ));
  }
}
