import 'package:flutter/material.dart';
import 'grid_paper_custom_painter.dart'; //모눈종이 클래스 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //1회용 위젯
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isVisible = false; // 소자 창 보이게 하는 변수
  bool _isDrawingMode = false; // 그리기 모드인지 여부를 나타내는 변수
  List<Offset> _points = [];
  List<List<Offset>> _lines = []; // 선을 그리기 위한 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회로설계 시뮬레이션"),
      ),
      body: Stack(
        children: <Widget>[
          CustomPaint(
            // 모눈종이 그리기
            painter: GridPaperCustomPainter(cellSize: 20.0),
            size: Size(double.infinity, double.infinity),
          ),

          Visibility(
              // 위젯 가시성 제어
              visible: _isVisible,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          color: Color.fromARGB(255, 118, 149, 170),
                          margin: EdgeInsets.only(top: 70),
                          child: TextButton(
                            child: Text(
                              'R',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            onPressed: () {},
                          )),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'L',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'C',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'V',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'I',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'W',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 118, 149, 170),
                        child: TextButton(
                          child: Text(
                            'G',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ))
                ], // 소자 목록 버튼 클릭 시 뜨는 것들.
              )),
          
 // 그림 그리기 영역을 화면 전체로 설정하여 아이콘 영역과 겹치지 않도록 함
    Positioned.fill(
      child: GestureDetector(
        onTap: () {
          // 그림 그리기 영역을 터치할 때 작업
        },
        onPanStart: (details) {
          setState(() {
            // 새로운 선을 그리기 시작하면 새 리스트를 생성하여 추가
            _lines.add([details.localPosition]);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            // 선을 그리는 중에는 현재 리스트에 점 추가
            _lines.last.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            // 그리기 종료 시 아무런 작업 필요 없음
          });
        },
        child: Stack(
          children: [
            // 그림 그리기 모드일 때
            if (_isDrawingMode)
              CustomPaint(
                painter: DrawingPainter(lines: _lines),
                size: Size.infinite,
              ),
            // 기타 그림 그리기 영역 위젯들 추가 가능
          ],
        ),
      ),
    ),

          Positioned(
            // 상단 중앙에 버튼 배치 - 총 8개 완성해야 함
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170), // 배경색 설정
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // 뒤로 가기 버튼이 클릭되었을 때 수행할 작업(우선 해놨는데 펜슬 구현해야 확인 가능할 듯)
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170), // 배경색 설정
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      // 앞으로 가기 버튼이 클릭되었을 때 수행할 작업
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white, size: 30),
                    onPressed: () {
                      // 펜슬 클릭 시 그리기 모드 토글
                      setState(() {
                        _isDrawingMode = !_isDrawingMode;
                      if (!_isDrawingMode) {
                        // 펜슬 모드 비활성화 시 현재 그린 선을 리스트에 추가하고 초기화
                        if (_lines.isNotEmpty) {
                          _lines.add([..._lines.last]);
                        }
                      }
                      });
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                    onPressed: () {
                      // 카메라 버튼이 클릭되었을 때 수행할 작업
                    },
                  ),
                ), 
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.white, size: 30),
                    onPressed: () {
                      //삭제 버튼이 클릭되었을 때 수행할 작업
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    onPressed: () {
                      //시뮬레이션 버튼이 클릭되었을 때 수행할 작업
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.multiline_chart, color: Colors.white, size: 30),
                    onPressed: () {
                      //I/V curve 버튼이 클릭되었을 때 수행할 작업
                    },
                  ),
                ),                               
                Container(
                  width: 50,
                  height: 50,
                  color: Color.fromARGB(255, 118, 149, 170),
                  child: IconButton(
                    icon: Icon(Icons.list, color: Colors.white, size: 30),
                    onPressed: () {
                      // 소자 목록 버튼 클릭하면 소자들이 보임.
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          // 그림 그리기 모드일 때
          if (_isDrawingMode)
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  // 새로운 선을 그리기 시작하면 새 리스트를 생성하여 추가
                  _lines.add([details.localPosition]);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  // 선을 그리는 중에는 현재 리스트에 점 추가
                  _lines.last.add(details.localPosition);
                });
              },
              onPanEnd: (details) {
                setState(() {
                  // 그리기 종료 시 아무런 작업 필요 없음
                });
              },
              child: CustomPaint(
                painter: DrawingPainter(lines: _lines),
                size: Size.infinite,
              ),
            ),
        ],
      ),
    );
  }
}

// 그림을 그리는 Painter 클래스
class DrawingPainter extends CustomPainter {
  final List<List<Offset>> lines; // 그린 선들을 저장하는 리스트

  DrawingPainter({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    // 그려진 선들을 화면에 그립니다.
    for (var line in lines) {
      _drawLine(canvas, line);
    }
  }

  void _drawLine(Canvas canvas, List<Offset> line) {
    if (line.length > 1) {
      Paint paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;

      for (int i = 0; i < line.length - 1; i++) {
        canvas.drawLine(line[i], line[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GridPaperCustomPainter extends CustomPainter {
  final double cellSize;

  GridPaperCustomPainter({required this.cellSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5;

    // 가로선 그리기
    for (double i = 0; i <= size.height / cellSize; i++) {
      final y = i * cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // 세로선 그리기
    for (double i = 0; i <= size.width / cellSize; i++) {
      final x = i * cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}