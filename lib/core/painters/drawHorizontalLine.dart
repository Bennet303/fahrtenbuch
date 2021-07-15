import 'package:flutter/widgets.dart';

class DrawHorizontalLine extends CustomPainter {
  Paint? _paint;
  double length;
  Alignment alignment;

  DrawHorizontalLine(BuildContext context,
      {required double strokeWidth,
      required StrokeCap strokeCap,
      required Color color,
      required this.length,
      this.alignment = Alignment.center}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (alignment.x == 0.0) {
      // center
      canvas.drawLine(
          Offset(-length / 2, 0.0), Offset(length / 2, 0.0), _paint!);
    } else if (alignment.x == -1) {
      // left
      canvas.drawLine(Offset(0.0, 0.0), Offset(length, 0.0), _paint!);
    } else {
      // right
      canvas.drawLine(Offset(-length, 0.0), Offset(0.0, 0.0), _paint!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
