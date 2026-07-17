import 'package:flutter/material.dart';

class BankOnboardingScreen extends StatelessWidget {
  // 🎮 1. The Walkie-Talkie reference to control your parent PageView deck
  final PageController controller;

  const BankOnboardingScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF041235), // Dark Midnight Navy Base
              Color(0xFF0E276C), // Deep Steel Blue
              Color(0xFF163C9E), // Vibrant Top Indigo Blue
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                const Spacer(flex: 2),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    CircleAvatar(
                      radius: 44,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/loading.png'),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'MIBANK',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Satoshi',
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 3),
                Text(
                  'One Wallet. Complete Control',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Satoshi',
                    height: 1.5,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 14),
                Text(
                  'Secure transfers, integrated tracking, and automated payments. All inside a beautifully designed dashboard.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: Color(0xFF8E9BB2),
                    color: Color(0xFFE7E7E7),
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'GeneralSans',
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Color(0xFF8E9BB2),
                      backgroundColor: const Color(0xFFE7E7E7),
                      foregroundColor: const Color(0xFF041235),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    onPressed: () {
                      controller.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
