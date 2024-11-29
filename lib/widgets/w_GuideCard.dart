import 'package:flutter/material.dart';
import 'package:terminal/theme/colors.dart';

Widget GuideCard(String title, IconData icon) {
  return Container(
    width: 157,
    height: 112,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: boxBackgroundColor,
      borderRadius: BorderRadius.circular(12),
      //boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 5, offset: Offset(2, 2))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 왼쪽 정렬
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 15,
            height: 1.2,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Icon(icon, size: 32, color: Colors.blue),
        ),
      ],
    ),
  );
}
