// Flutter의 UI 라이브러리를 임포트합니다.
import 'package:flutter/material.dart';

// CustomPainter를 상속받는 GridPaperCustomPainter 클래스를 정의합니다.
// 이 클래스는 사용자 정의 그림을 그리는 데 사용됩니다.
class GridPaperCustomPainter extends CustomPainter {
  // 모눈종이의 각 셀(칸)의 크기를 저장하는 변수입니다.
  final double cellSize;

  // 생성자에서 cellSize의 값을 설정할 수 있습니다. 기본값은 20.0으로 설정되어 있습니다.
  GridPaperCustomPainter({this.cellSize = 20.0});

  // 캔버스에 그림을 그리는 메서드입니다.
  // 이 메서드는 CustomPainter 클래스에서 오버라이드해야 하는 메서드입니다.
  @override
  void paint(Canvas canvas, Size size) {
    // Paint 객체를 생성하고, 그림을 그릴 때 사용할 속성(색상, 선의 굵기 등)을 설정합니다.
    var paint = Paint()
      ..color = Colors.grey  // 선의 색상을 회색으로 설정합니다.
      ..strokeWidth = 1;  // 선의 굵기를 1로 설정합니다.

    // 가로 방향의 선을 그립니다. 모눈종이의 너비(size.width)만큼 반복하면서 선을 그립니다.
    for (double i = 0; i <= size.width; i += cellSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // 세로 방향의 선을 그립니다. 모눈종이의 높이(size.height)만큼 반복하면서 선을 그립니다.
    for (double i = 0; i <= size.height; i += cellSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  // 위젯이 다시 그려져야 할 때, 이 메서드가 호출됩니다.
  // 현재 구현에서는 항상 false를 반환하여, 위젯이 상태가 변경되어도 다시 그리지 않도록 합니다.
  // 이는 성능 최적화를 위한 일반적인 방법입니다.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
