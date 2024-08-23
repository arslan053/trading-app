// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/setting_provider.dart';

class PositionSizeScreen extends StatefulWidget {
  const PositionSizeScreen({super.key});

  @override
  _PositionSizeScreenState createState() => _PositionSizeScreenState();
}

class _PositionSizeScreenState extends State<PositionSizeScreen> {
  final TextEditingController _equityController = TextEditingController();
  final TextEditingController _riskController = TextEditingController();
  final TextEditingController _stopLossController = TextEditingController();

  double _positionSize = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with values from settings or defaults
    final accountEquity = Provider.of<SettingsProvider>(context, listen: false).accountEquity ?? 1.0;
    final riskPerTrade = Provider.of<SettingsProvider>(context, listen: false).riskPerTrade ?? 1.0;
    
    _equityController.text = accountEquity.toString();
    _riskController.text = riskPerTrade.toString();
  }

  void _calculatePositionSize() {
    final equity = double.tryParse(_equityController.text) ?? 1.0;
    final risk = double.tryParse(_riskController.text) ?? 1.0;
    final stopLoss = double.tryParse(_stopLossController.text) ?? 1.0;

    if (stopLoss == 0) {
      // Handle division by zero error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Stop Loss cannot be zero')),
      );
      return;
    }

    setState(() {
      _positionSize = (equity * risk) / stopLoss;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Position Size Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _equityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Account Equity'),
            ),
            TextField(
              controller: _riskController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Risk Per Trade (%)'),
            ),
            TextField(
              controller: _stopLossController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Stop Loss (Pips)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculatePositionSize,
              child: const Text('Calculate'),
            ),
            if (_positionSize > 0)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Position Size: $_positionSize',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
