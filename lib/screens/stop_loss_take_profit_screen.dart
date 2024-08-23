import 'package:flutter/material.dart';

class StopLossTakeProfitScreen extends StatefulWidget {
  const StopLossTakeProfitScreen({super.key});

  @override
  _StopLossTakeProfitScreenState createState() => _StopLossTakeProfitScreenState();
}

class _StopLossTakeProfitScreenState extends State<StopLossTakeProfitScreen> {
  final TextEditingController _entryPriceController = TextEditingController();
  final TextEditingController _riskPerTradeController = TextEditingController();
  final TextEditingController _pipValueController = TextEditingController();
  final TextEditingController _rewardRatioController = TextEditingController();

  double _stopLossPrice = 0.0;
  double _takeProfitPrice = 0.0;

  void _calculateStopLossAndTakeProfit() {
    final entryPrice = double.tryParse(_entryPriceController.text);
    final riskPerTrade = double.tryParse(_riskPerTradeController.text);
    final pipValue = double.tryParse(_pipValueController.text);
    final rewardRatio = double.tryParse(_rewardRatioController.text);

    // Error handling: Ensure all inputs are valid numbers
    if (entryPrice == null || riskPerTrade == null || pipValue == null || rewardRatio == null ||
        entryPrice <= 0 || riskPerTrade <= 0 || pipValue <= 0 || rewardRatio <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers in all fields')),
      );
      return;
    }

    setState(() {
      _stopLossPrice = entryPrice - (riskPerTrade * pipValue);
      _takeProfitPrice = entryPrice + (rewardRatio * pipValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Loss & Take Profit Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _entryPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Entry Price'),
            ),
            TextField(
              controller: _riskPerTradeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Risk Per Trade'),
            ),
            TextField(
              controller: _pipValueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Pip Value'),
            ),
            TextField(
              controller: _rewardRatioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Reward Ratio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateStopLossAndTakeProfit,
              child: const Text('Calculate'),
            ),
            if (_stopLossPrice != 0.0 && _takeProfitPrice != 0.0)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stop Loss Price: \$${_stopLossPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Take Profit Price: \$${_takeProfitPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
