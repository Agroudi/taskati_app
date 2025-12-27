import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget
{
  final Color color;
  final String title;
  final String subtitle;
  final String startTime;
  final String endTime;

  const TaskCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
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
              fontSize: 18,
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
                  fontSize: 14,
                ),
              ),
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white70, size: 16),
              const SizedBox(width: 6),
              Text(
                '$startTime  →  $endTime',
                style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'Poppins-Regular',),
              ),
            ],
          ),
        ],
      ),
    );
  }
}