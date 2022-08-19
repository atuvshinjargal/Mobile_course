import 'package:flutter/material.dart';

import 'star.dart';

class StarRating extends StatelessWidget {
  final Color color;
  final int value;
  final double starSize;

  const StarRating({
    Key? key,
    required this.value,
    this.color = Colors.deepOrange,
    this.starSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        value,
        (index) => Padding(
          padding: const EdgeInsets.all(2),
          child: Star(
            color: color,
            size: starSize,
          ),
        ),
      ),
    );
  }
}
