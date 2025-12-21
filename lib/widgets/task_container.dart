import 'package:flutter/material.dart';

Widget taskCard({
  required Color color,
  required String title,
  required String time,
  required String subtitle,
}) {
  return Container(
    height: 120,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.white70,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 1,
          height: double.infinity,
          color: Colors.white30,
          margin: EdgeInsets.symmetric(horizontal: 12),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            "TODO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    ),
  );
}