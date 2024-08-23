// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/color_constants.dart';
import '../providers/setting_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _accountEquityController;
  late double _riskPerTrade;

  @override
  void initState() {
    super.initState();
    final settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
    _accountEquityController = TextEditingController(text: settingsProvider.accountEquity);
    _riskPerTrade = settingsProvider.riskPerTrade;
  }

  void _saveSettings() {
    final String accountEquity = _accountEquityController.text;
    final double riskPerTrade = _riskPerTrade;

    Provider.of<SettingsProvider>(context, listen: false)
        .updateSettings(accountEquity, riskPerTrade);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adjust Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSettingItem('Account Equity', _accountEquityController),
            const SizedBox(height: 20),
            _buildRiskPerTradeSlider(),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  backgroundColor: ColorConstants.primaryColor,
                ),
                child: const Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildRiskPerTradeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Risk Per Trade (%)', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Slider(
          value: _riskPerTrade,
          min: 0,
          max: 100,
          divisions: 100,
          label: '${_riskPerTrade.round()}%',
          onChanged: (value) {
            setState(() {
              _riskPerTrade = value;
            });
          },
        ),
      ],
    );
  }
}
