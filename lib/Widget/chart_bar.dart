import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPacOfAmount;

  ChartBar(this.label, this.spendingAmount, this.spendingPacOfAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text("\u{20B9}${spendingAmount.toStringAsFixed(0)}",style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
          ),
        const SizedBox(height: 4,),
        Container(height: 80, width: 10, 
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1),
              color: const Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(20),
              ),

            ),
            FractionallySizedBox(heightFactor: spendingPacOfAmount, 
            child: Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            ),
            
            ),
            ),
          ],
        ),),
        SizedBox(height: 4,),
        Text(label),
      ],
    );
  }
}
