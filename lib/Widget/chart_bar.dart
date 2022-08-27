import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPacOfAmount;

  ChartBar(this.label, this.spendingAmount, this.spendingPacOfAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight*0.15,
              child: FittedBox(
                child: Text(
                  "\u{20B9}${spendingAmount.toStringAsFixed(0)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
             SizedBox(
              height: constraints.maxHeight*0.05,
            ),
            Container(
             height: constraints.maxHeight*0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPacOfAmount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
              height: constraints.maxHeight*0.05,
            ),
            Container(height: constraints.maxHeight*0.15,
              child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
