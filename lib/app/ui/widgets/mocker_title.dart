import 'package:flutter/material.dart';

class MockWeightTitle extends StatelessWidget {
  const MockWeightTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('MOCK MY WEIGHT',
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(letterSpacing: 6));
  }
}
