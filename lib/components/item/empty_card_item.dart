import 'package:flutter/material.dart';
import 'package:projeto/measures/pattern_measures.dart';

class EmptyCardItem extends StatelessWidget {
  final IconData icon;

  const EmptyCardItem({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PatternMeasures.listCardPadding,
      child: Center(
        child: Padding(
          padding: PatternMeasures.listCardPadding,
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
