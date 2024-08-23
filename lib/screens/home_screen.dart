import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
       appBar: AppBar(
        title: const Text('Risk Management App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, Routes.setting);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Risk Management Tools',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: ColorConstants.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Calculate your Position Size, Risk-Reward Ratio, and Stop Loss/Take Profit easily.',
              style: TextStyle(
                fontSize: 16.0,
                color: ColorConstants.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routes.positionSize);
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Position Size'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full-width buttons
                textStyle: const TextStyle(fontSize: 18.0),
                backgroundColor: ColorConstants.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routes.riskReward);
              },
              icon: const Icon(Icons.trending_up),
              label: const Text('Risk-Reward Ratio'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 18.0),
                backgroundColor: ColorConstants.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, Routes.stopLossTakeProfit);
              },
              icon: const Icon(Icons.security),
              label: const Text('Stop Loss & Take Profit'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 18.0),
                backgroundColor: ColorConstants.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
