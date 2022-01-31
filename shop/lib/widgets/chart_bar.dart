import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, con) {
        return Column(children: [
          Container(
            height: con.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: con.maxHeight * 0.05,
          ),
          Container(
            height: con.maxHeight * 0.60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    color: Color.fromRGBO(220, 220, 200, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.0),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: con.maxHeight * 0.05,
          ),
          Container(
            height: con.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ]);
      },
    );
  }
}
