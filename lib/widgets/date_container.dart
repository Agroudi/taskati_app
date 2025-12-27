import 'package:flutter/material.dart';

Widget DateItem({
  required String month,
  required String day,
  required String weekDay,
  bool isSelected = false,
}) {
  return Container(
    width: 90,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: isSelected ? Colors.blue.shade900 : Colors.transparent,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      children: [
        Text(
          month,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          weekDay,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ],
    ),
  );
}