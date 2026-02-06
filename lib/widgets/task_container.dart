import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String startTime;
  final String endTime;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins-Regular',
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const Spacer(),

                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        '$startTime  →  $endTime',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// RIGHT VERTICAL STATUS
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Container(
              width: 48,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white30,
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    isCompleted ? "COMPLETED" : "TODO",
                    style: const TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}