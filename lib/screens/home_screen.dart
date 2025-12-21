import 'package:flutter/material.dart';
import 'package:taskati_app/widgets/date_container.dart';
import 'package:taskati_app/widgets/task_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! Abdelrahman',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Have A Nice Day.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://imgs.search.brave.com/C2W8qVxkSsmb6-1spIYRRoeQJlHrUsODHDkaGhadV7I/rs:fit:0:180:1:0/g:ce/aHR0cHM6Ly9zdGlt/Zy5jYXJkZWtoby5j/b20vaW1hZ2VzL2Nh/cmV4dGVyaW9yaW1h/Z2VzLzYzMHg0MjAv/TGFtYm9yZ2hpbmkv/UmV2dWVsdG8vOTc3/MC8xNzUwMDYxMzIz/ODA0L2Zyb250LWxl/ZnQtc2lkZS00Ny5q/cGc_dHI9dy0yMzA'),
                  )
                ],
              ),
              SizedBox(height: 24),

// Date + Today + Add Task
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "October 30, 2023",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "+ Add Task",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Poppins-Regular'
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DateItem(
                      month: "OCT",
                      day: "30",
                      weekDay: "MON",
                      isSelected: true,
                    ),
                    SizedBox(width: 12),
                    DateItem(month: "OCT", day: "31", weekDay: "TUE"),
                    SizedBox(width: 12),
                    DateItem(month: "NOV", day: "1", weekDay: "WED"),
                    SizedBox(width: 12),
                    DateItem(month: "NOV", day: "2", weekDay: "THU"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              taskCard(
                color: Colors.blue.shade600,
                title: "Flutter Task - 1",
                time: "02:25 AM - 02:40 AM",
                subtitle: "I will do This Task",
              ),
              SizedBox(height: 16),
              taskCard(
                color: Colors.redAccent,
                title: "Flutter Task - 2",
                time: "4:27 PM - 6:42 PM",
                subtitle: "I will do This Task",
              ),
              SizedBox(height: 16),
              taskCard(
                color: Colors.orangeAccent,
                title: "Flutter Task - 3",
                time: "7:27 PM - 9:43 PM",
                subtitle: "I will do This Task",
              ),
            ],
          ),
        ),
      ),
    );
  }
}