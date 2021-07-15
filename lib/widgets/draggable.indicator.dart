import 'package:fahrtenbuch/core/painters/drawHorizontalLine.dart';
import 'package:flutter/material.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: CustomPaint(
          painter: DrawHorizontalLine(
            context,
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            color: Colors.grey[700]!,
            length: 80,
          ),
        ),
      ),
    );
  }
}
