import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.amountSpending, this.totalSpendingPercentage,
      {super.key});

  final String label;
  final double amountSpending;
  final double totalSpendingPercentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
              height: constraints.maxHeight * 0.12,
              child: FittedBox(
                  child: Text('\$${amountSpending.toStringAsFixed(0)}'))),
          SizedBox(
            height: constraints.maxHeight * 0.76,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: totalSpendingPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.12,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
