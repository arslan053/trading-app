// lib/providers/settings_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  double _riskPerTrade = 1.0;
  String _accountEquity = '10000';

  double get riskPerTrade => _riskPerTrade;
  String get accountEquity => _accountEquity;

  void updateSettings(String equity, double risk) async {
    _accountEquity = equity;
    _riskPerTrade = risk;
    notifyListeners();

    // Save settings to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accountEquity', equity);
    await prefs.setDouble('riskPerTrade', risk);
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accountEquity = prefs.getString('accountEquity') ?? '10000';
    _riskPerTrade = prefs.getDouble('riskPerTrade') ?? 1.0;
    notifyListeners();
  }
}
