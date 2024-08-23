import 'package:flutter/material.dart';

class RiskRewardScreen extends StatefulWidget {
  @override
  _RiskRewardScreenState createState() => _RiskRewardScreenState();
}

class _RiskRewardScreenState extends State<RiskRewardScreen> {
  final TextEditingController _entryPriceController = TextEditingController();
  final TextEditingController _stopLossController = TextEditingController();
  final TextEditingController _takeProfitController = TextEditingController();

  double _riskRewardRatio = 0.0;

  void _calculateRiskRewardRatio() {
    final entryPrice = double.tryParse(_entryPriceController.text);
    final stopLoss = double.tryParse(_stopLossController.text);
    final takeProfit = double.tryParse(_takeProfitController.text);

    // Error handling: Ensure all inputs are valid numbers
    if (entryPrice == null || stopLoss == null || takeProfit == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers in all fields')),
      );
      return;
    }

    // Error handling: Ensure stop loss is less than entry price
    if (stopLoss >= entryPrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Stop Loss should be less than Entry Price')),
      );
      return;
    }

    // Error handling: Ensure take profit is greater than entry price
    if (takeProfit <= entryPrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Take Profit should be greater than Entry Price')),
      );
      return;
    }

    setState(() {
      _riskRewardRatio = (takeProfit - entryPrice) / (entryPrice - stopLoss);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Risk-Reward Ratio Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _entryPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Entry Price'),
            ),
            TextField(
              controller: _stopLossController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Stop Loss Price'),
            ),
            TextField(
              controller: _takeProfitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Take Profit Price'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateRiskRewardRatio,
              child: Text('Calculate'),
            ),
            if (_riskRewardRatio != 0.0)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Risk-Reward Ratio: ${_riskRewardRatio.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
