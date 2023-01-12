import 'package:flutter/material.dart';

class XPaintWidget extends CustomPainter {
  final double diferenciaAltura = 30;
  final double diferenciaLargura = 40;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    Offset startingPoint =
        Offset(diferenciaLargura, size.height - diferenciaAltura);
    Offset endingPoint =
        Offset(size.width - diferenciaLargura, diferenciaAltura);

    canvas.drawLine(startingPoint, endingPoint, paint);
    startingPoint = Offset(diferenciaLargura, diferenciaAltura);
    endingPoint =
        Offset(size.width - diferenciaLargura, size.height - diferenciaAltura);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
