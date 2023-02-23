import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChartBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  const ChartBar({this.label, this.value, this.percentage, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: -math.pi / 4,
          child: Container(
            height: 20,
            child: FittedBox(
              child: Text('R\$ ${value?.toStringAsFixed(2)}'),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label!),
      ],
    );
  }
}
