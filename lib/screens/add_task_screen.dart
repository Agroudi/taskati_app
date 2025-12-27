import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>
{
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  final titleController = TextEditingController();
  final descController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Color getRandomColor()
  {
    final colors = [
      Colors.blue.shade600,
      Colors.redAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.teal,
      Colors.indigo,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  bool isEndAfterStart()
  {
    if (startTime == null || endTime == null) return true;

    final start = startTime!.hour * 60 + startTime!.minute;
    final end = endTime!.hour * 60 + endTime!.minute;
    return end > start;
  }

  @override
  Widget build(BuildContext context)
  {
    final dateFormat = DateFormat('MMM d, yyyy');
    final timeFormat = DateFormat('hh:mm a');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Title can’t be empty' : null,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: descController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v == null || v.trim().isEmpty ? 'Description can’t be empty' : null,
              ),

              const SizedBox(height: 12),

              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: const OutlineInputBorder(),
                  errorText: _autoValidate == AutovalidateMode.always &&
                      selectedDate == null ? 'Date can’t be empty' : null,
                ),
                child: InkWell(
                  onTap: () async
                  {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (date != null)
                    {
                      setState(() => selectedDate = date);
                    }
                  },
                  child: Text(
                    selectedDate == null ? 'Select Date' : dateFormat.format(selectedDate!),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Start Time',
                  border: const OutlineInputBorder(),
                  errorText: _autoValidate == AutovalidateMode.always &&
                      startTime == null ? 'Start time required' : null,
                ),
                child: InkWell(
                  onTap: () async
                  {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null)
                    {
                      setState(() => startTime = time);
                    }
                  },
                  child: Text(
                    startTime == null
                        ? 'Select Start Time'
                        : timeFormat.format(
                      DateTime(0, 0, 0,
                        startTime!.hour,
                        startTime!.minute,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'End Time',
                  border: const OutlineInputBorder(),
                  errorText: _autoValidate == AutovalidateMode.always
                      ? endTime == null ? 'End time required'
                      : !isEndAfterStart() ? 'End time must be after start' : null : null,
                ),
                child: InkWell(
                  onTap: () async
                  {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null)
                    {
                      setState(() => endTime = time);
                    }
                  },
                  child: Text(
                    endTime == null ? 'Select End Time' : timeFormat.format(
                      DateTime(0, 0, 0,
                        endTime!.hour,
                        endTime!.minute,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: ()
                  {
                    setState(()
                    {
                      _autoValidate = AutovalidateMode.always;
                    });

                    if (!_formKey.currentState!.validate()) return;
                    if (selectedDate == null || startTime == null || endTime == null || !isEndAfterStart())
                    {
                      return;
                    }

                    Navigator.pop(context,
                        {
                      'title': titleController.text.trim(),
                      'subtitle': descController.text.trim(),
                      'date': selectedDate,
                      'startTime': timeFormat.format(
                        DateTime(0, 0, 0,
                          startTime!.hour,
                          startTime!.minute,
                        ),
                      ),
                      'endTime': timeFormat.format(
                        DateTime(0, 0, 0,
                          endTime!.hour,
                          endTime!.minute,
                        ),
                      ),
                      'color': getRandomColor(),
                    });
                  },
                  child: const Text('Create Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}