import 'package:flutter/material.dart';

import '../../../data/model/foot_step.dart';
class StepCard extends StatelessWidget {
  const StepCard({super.key, required this.footSteps});
  final FootSteps footSteps;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            footSteps.value.toStringAsFixed(2),
            style: const TextStyle(fontSize: 24),
          ),
          Text(footSteps.unit),
          Text(
            footSteps.dateFrom.toString(),
          ),
        ],
      ),
    );
  }
}