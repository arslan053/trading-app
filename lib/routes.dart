// lib/routes.dart
import 'package:flutter/material.dart';
import 'package:trading/screens/home_screen.dart';
import 'package:trading/screens/position_size_screen.dart';
import 'package:trading/screens/risk_reward_screen.dart';
import 'package:trading/screens/setting_screen.dart';
import 'package:trading/screens/stop_loss_take_profit_screen.dart';

class Routes {
  static const String home = '/';
  static const String positionSize = '/position-size';
  static const String riskReward = '/risk-reward';
  static const String stopLossTakeProfit = '/stop-loss-take-profit';
  static const String setting = '/settings';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case positionSize:
        return MaterialPageRoute(builder: (_) => PositionSizeScreen());
      case riskReward:
        return MaterialPageRoute(builder: (_) => RiskRewardScreen());
      case stopLossTakeProfit:
        return MaterialPageRoute(builder: (_) => StopLossTakeProfitScreen());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Unknown route')),
          ),
        );
    }
  }
}
