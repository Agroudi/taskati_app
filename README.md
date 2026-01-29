📝 Taskati – Smart Task Management App
Taskati is a clean and modern task management mobile app built with Flutter, designed to help users organize their daily tasks efficiently with clear time tracking and a smooth user experience 🚀.
The app allows users to create, view, and manage tasks with required start time, end time, and end date, ensuring better planning, productivity, and accountability ⏱️📅.
🎯 What the App Is Used For
✅ Create new tasks with full validation
⏰ Assign start time & end time to each task
📆 Set an end date for better scheduling
🧠 Prevent empty or incorrect inputs with real-time validation
📋 View tasks in a clean, scrollable list
💾 Persist tasks locally so data is never lost
Perfect for students, professionals, and daily planners who want control over their time 💼📚.
💾 Local Storage with Hive
The app uses Hive 🐝 as a lightweight and blazing-fast local database to store tasks directly on the device.
Why Hive?
⚡ Extremely fast read/write operations
📦 No SQL or complex setup
🔒 Data stays on the device (offline-first)
♻️ Tasks remain saved even after closing or restarting the app
Hive is used to store all task data, including:
Title & description
Start time & end time
End date
Task color
This ensures a reliable and seamless offline experience 💪.
🧩 Widgets & Technologies Used
🧱 Scaffold – app structure
📜 ListView.separated – task listing
📝 Form & TextFormField – validated input
🎛 ElevatedButton – actions & submissions
🧩 Container, Column, Row, Padding, SizedBox – layout
⏳ TimePicker & 📅 DatePicker – time & date selection
🎨 ThemeData – global styling
🐝 Hive – local data persistence
🎨 UI / UX Design System
🎨 Colors
🔵 Primary: Colors.blue.shade900
⚪ Clean light backgrounds
🔴 Red error states for validation feedback
🔤 Typography
Clean Material system font
Strong hierarchy for titles, subtitles, and metadata
High readability and contrast
🧭 UI Flow
🏠 Home screen displays saved tasks
➕ Create task button (highlighted in blue[900])
📝 Form with strict validation
💾 Task saved instantly using Hive
📋 UI updates automatically
Every interaction is designed to feel simple, fast, and intentional ✨.
🚀 Built With
Flutter 🐦
Dart 💙
Hive 🐝
Material Design 🎨

https://github.com/user-attachments/assets/6b87decd-9a24-43ec-b41c-f4c5c4e97ac6

