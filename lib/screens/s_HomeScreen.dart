import 'package:flutter/material.dart';
import 'package:terminal/theme/colors.dart';
import 'package:terminal/widgets/w_PainRecordBox.dart';
import 'package:terminal/widgets/w_GuideCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면 높이 계산
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = 64.0; // AppBar 높이
    final bottomNavBarHeight = 90.0; // BottomNavigationBar 높이

    // 화면에 들어갈 수 있는 최대 높이
    final contentHeight = screenHeight - appBarHeight - bottomNavBarHeight;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          backgroundColor: boxBackgroundColor,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 35, top: 55, right: 18),
            child: Row(
              children: [
                Text(
                  '스윗홈',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NPS font',
                    letterSpacing: 0.3,
                    height: 1.5,
                  ),
                ),
                Spacer(),
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_none_outlined, color: Colors.black),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: primaryColor,
                        child: Text(
                          '2',
                          style: TextStyle(color: boxBackgroundColor, fontSize: 11),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          constraints: BoxConstraints(minHeight: contentHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '통증 기록하기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Pretendard',
                  height: 1.4,
                ),
              ),
              SizedBox(height: 5),
              PainRecordBox(),
              SizedBox(height: 20), // 간격 추가
              Text(
                '통증 가이드',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Pretendard',
                  height: 1.4,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  GuideCard('진통제\n로테이션이란?', Icons.calendar_today),
                  SizedBox(width: 10),
                  GuideCard('나이별 권장\n진통제 섭취량', Icons.medical_services),
                ],
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: '통증\n리포트'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: '진통제\n관리'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: '통증\n가이드'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}
