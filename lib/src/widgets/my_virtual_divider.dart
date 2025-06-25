import 'package:flutter/material.dart';

class MyVirtualDivider extends StatelessWidget {
  final Color color;
  const MyVirtualDivider(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: VerticalDivider(color: color, width: 1, thickness: 1),
    );
  }
}
