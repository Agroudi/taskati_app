import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/screens/add_task_screen.dart';
import 'package:taskati_app/screens/update_profile_screen.dart';
import 'package:taskati_app/widgets/app_user.dart';
import 'package:taskati_app/widgets/date_container.dart';
import 'package:taskati_app/widgets/task_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  final List<Map<String, dynamic>> tasks = [];
  DateTime selectedDate = DateTime.now();

  List<Map<String, dynamic>> get filteredTasks => tasks
      .where((task) =>
  task['date'].year == selectedDate.year &&
      task['date'].month == selectedDate.month &&
      task['date'].day == selectedDate.day).toList();

  @override
  void initState()
  {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async
  {
    final box = Hive.box('tasksBox');
    final savedList = box.get('tasks', defaultValue: []);

    setState(() {
      tasks.clear();
      tasks.addAll((savedList as List).map((task) => {
        'title': task['title'],
        'subtitle': task['subtitle'],
        'startTime': task['startTime'],
        'endTime': task['endTime'],
        'color': Color(task['color']),
        'date': DateTime.parse(task['date']),
        'completed': task['completed'] ?? false,
      }));
    });
  }

  Future<void> saveTasks() async
  {
    final box = Hive.box('tasksBox');

    final saveList = tasks.map((task) => {
      'title': task['title'],
      'subtitle': task['subtitle'],
      'startTime': task['startTime'],
      'endTime': task['endTime'],
      'color': (task['color'] as Color).value,
      'date': (task['date'] as DateTime).toIso8601String(),
      'completed': task['completed'] ?? false,
    }).toList();

    await box.put('tasks', saveList);
  }

  Future<void> toggleTaskCompleted(Map<String, dynamic> task) async
  {
    setState(() {
      task['completed'] = !(task['completed'] ?? false);
    });
    await saveTasks();
  }

  void selectDate(DateTime date)
  {
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> changeUserName(String newName) async
  {
    AppUser.name = newName;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', newName);
    setState(() {});
  }

  Future<void> changeUserPhoto(String path) async
  {
    AppUser.imagePath = path;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_photo', path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context)
  {
    final today = DateTime.now();

    return Scaffold(
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
                                  'Hello! ${AppUser.name}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: 'Poppins-Regular',
                                      color: Colors.blue.shade900,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                  'Have A Nice Day.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Poppins-Regular'
                                  )
                              )
                            ]
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            final updated = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const UploadProfileScreen(),
                              ),
                            );

                            if (updated == true) {
                              setState(() {});
                            }
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AppUser.image,
                            child: AppUser.image == null
                                ? const Icon(Icons.person)
                                : null,
                          ),
                        )

                      ]
                  ),

                  const SizedBox(height: 24),

                  Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${today.day} ${_monthName(today.month)}, ${today.year}",
                                style: const TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            const SizedBox(height: 4),
                            const Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins-Regular'
                                )
                            )
                          ],
                        ),

                        const Spacer(),

                        ElevatedButton(
                            onPressed: () async
                            {
                              final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => const AddTaskScreen())
                              );

                              if (result != null)
                              {
                                setState(()
                                {
                                  tasks.add(result);
                                });
                                await saveTasks();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)
                                )
                            ),
                            child: const Text(
                                "+ Add Task",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Poppins-Regular'
                                )
                            )
                        )
                      ]
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                      height: 110,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (context, index)
                          {
                            final date = DateTime.now().add(Duration(days: index));
                            final isSelected =
                                date.year == selectedDate.year &&
                                    date.month == selectedDate.month &&
                                    date.day == selectedDate.day;
                            return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: GestureDetector(
                                    onTap: () => selectDate(date),
                                    child: DateItem(
                                        month: _monthAbbr(date.month),
                                        day: date.day.toString(),
                                        weekDay: _weekDayAbbr(date.weekday),
                                        isSelected: isSelected
                                    )
                                )
                            );
                          }
                      )
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                      child: filteredTasks.isEmpty
                          ? const Center(
                          child: Text(
                              'No tasks yet',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins-Regular'
                              )
                          )
                      )
                          : ListView.separated(
                          itemCount: filteredTasks.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index)
                          {
                            final task = filteredTasks[index];

                            return Dismissible(
                              key: ValueKey(task),
                              direction: DismissDirection.horizontal,
                              background: Container(
                                padding: const EdgeInsets.only(left: 16),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(18)
                                ),
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),

                              secondaryBackground: Container(
                                padding: const EdgeInsets.only(right: 16),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(18)
                                ),
                                child: const Icon(Icons.check, color: Colors.white),
                              ),

                              confirmDismiss: (direction) async
                              {
                                if (direction == DismissDirection.startToEnd)
                                {
                                  setState(()
                                  {
                                    tasks.remove(task);
                                  });
                                  await saveTasks();
                                  return true;
                                }
                                else
                                {
                                  await toggleTaskCompleted(task);
                                  return false;
                                }
                              },

                              child: Stack(
                                children: [
                                  TaskCard(
                                    color: task['color'] as Color,
                                    title: task['title'] as String,
                                    subtitle: task['subtitle'] as String,
                                    startTime: task['startTime'] as String,
                                    endTime: task['endTime'] as String,
                                    isCompleted: task['completed'] ?? false,
                                  ),
                                ],
                              ),
                            );
                          }
                      )
                  )
                ]
            )
        )
    );
  }

  String _monthAbbr(int month)
  {
    const months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
    return months[month - 1];
  }

  String _monthName(int month)
  {
    const months = [
      'January','February','March','April','May','June',
      'July','August','September','October','November','December'
    ];
    return months[month - 1];
  }

  String _weekDayAbbr(int weekday)
  {
    const days = ['MON','TUE','WED','THU','FRI','SAT','SUN'];
    return days[weekday - 1];
  }
}