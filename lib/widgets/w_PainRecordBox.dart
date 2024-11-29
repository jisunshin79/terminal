import 'package:flutter/material.dart';
import 'package:terminal/theme/colors.dart';
import 'package:terminal/screens/s_PainRecordScreen.dart';

class PainRecordBox extends StatefulWidget {
  @override
  _PainRecordBoxState createState() => _PainRecordBoxState();
}

class _PainRecordBoxState extends State<PainRecordBox> {
  double currentIndex = 1.0;

  @override
  Widget build(BuildContext context) {
    // 동적 segmentWidth 계산: 화면 너비를 7등분
    double segmentWidth = 42;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: boxBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 날짜와 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '오늘',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '2024 - 11 - 25',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff777777),
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(

                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF2F2F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    '날짜/시간 변경하기',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff333333),
                      fontFamily: 'Pretendard',
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // 색상 바와 드래그 가능한 동그라미
            Stack(
              children: [
                // 색상 바
                Row(
                  children: List.generate(7, (index) {
                    return Expanded(
                      child: Container(
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: _getColorForPainLevel(index + 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
                // 드래그 가능한 동그라미
                Positioned(
                  left: (currentIndex - 1) * segmentWidth,
                  top: -12,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        // 드래그된 위치를 구간에 맞게 조정
                        double newPosition = (details.localPosition.dx / segmentWidth)
                            .clamp(0.0, 6.0); // 드래그 범위를 제한
                        currentIndex = newPosition + 1.0; // 인덱스 업데이트
                      });
                    },
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: boxBackgroundColor,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 1.8),
                        ),
                        child: Center(
                          child: Text(
                            '${currentIndex.toInt()}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            // 숫자 표시 (클릭 가능)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = (index + 1).toDouble(); // 숫자 클릭 시 인덱스 업데이트
                    });
                  },
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      color: index + 1 == currentIndex.toInt()
                          ? Colors.black
                          : Color(0xff777777),
                      fontWeight: index + 1 == currentIndex.toInt()
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 25),
            // 기록하기 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PainRecordScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  '기록하기',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 통증 강도에 따른 색상 반환 함수
  Color _getColorForPainLevel(int level) {
    switch (level) {
      case 1:
        return Color(0xff93FC63);
      case 2:
        return Color(0xff93FC63);
      case 3:
        return Color(0xffFCF763);
      case 4:
        return Color(0xffFCCB63);
      case 5:
        return Color(0xffFC9163);
      case 6:
        return Color(0xffFC6F63);
      case 7:
        return Color(0xffFF6F63);
      default:
        return Colors.grey;
    }
  }
}
