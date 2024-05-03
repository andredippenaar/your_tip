import 'package:flutter/material.dart';
import 'package:your_tip/widgets/bill_amount_field.dart';
import 'package:your_tip/widgets/person_counter.dart';
import 'package:your_tip/widgets/tip_row.dart';
import 'package:your_tip/widgets/tip_slider.dart';
import 'package:your_tip/widgets/total_per_person.dart';

class YourTip extends StatefulWidget {
  const YourTip({super.key});

  @override
  State<YourTip> createState() => _YourTipState();
}

class _YourTipState extends State<YourTip> {
  int _personCount = 1;

  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return (((_billTotal * _tipPercentage) + (_billTotal)) / _personCount);
  }

  double totalTip() {
    return ((_billTotal * _tipPercentage));
  }

  // Methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();
    // Add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('You Tip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(theme: theme, style: style, total: total),
          //Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) {
                      setState(() {
                        _billTotal = double.parse(value);
                      });
                      // print("Amount: $value");
                    },
                  ),
                  // === Split bill area ==
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDecrement: decrement,
                    onIncrement: increment,
                  ),
                  // === Tip Section ==
                  TipRow(theme: theme, totalT: totalT),
                  // === Slider Text ==
                  Text('${(_tipPercentage * 100).round()}%'),
                  // == Tip Slider ==
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
