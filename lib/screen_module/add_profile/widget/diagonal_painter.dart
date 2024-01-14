import 'package:flutter/material.dart';

class DiagonalWidget extends StatelessWidget {
  const DiagonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      width: 12,
      height: 20,
      child: CustomPaint(
        painter: DiagonalPainter(),
      ),
    );
  }
}

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF6C6C6C) // 선의 색상 설정
      ..strokeWidth = 1.0; // 선의 두께 설정

    final Offset start = Offset(0, size.height); // 시작 지점
    final Offset end = Offset(size.width, 0); // 끝나는 지점

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
