<h1>🗂️ Taskati – Task Management App (Flutter)
📌 Overview</h1>

Taskati is a lightweight and efficient task management application built with Flutter.
It helps users organize daily tasks with precise scheduling, validation, and persistent local storage.

The app is fully offline-capable and designed with a clean, modern UI following Material Design principles.

<h1>🚀 Features</h1>

Create tasks with title, description, date, start time, and end time

Strong form validation with clear error feedback

Random task color assignment for visual distinction

Swipe-to-delete task functionality

Persistent local storage using Hive

Clean and minimal UI focused on usability

<h1>🧠 Local Storage (Hive)</h1>

Hive is used as the local NoSQL database

Tasks are stored on-device for fast access and offline usage

Data remains saved even after app restarts

Hive provides high performance without requiring SQL or internet access

<h1>🧩 Widgets & Packages Used</h1>

Scaffold – App layout structure

AppBar – Screen headers

Form & TextFormField – User input with validation

ListView.separated – Displaying task lists

Dismissible – Swipe-to-delete tasks

ElevatedButton – User actions

showDatePicker & showTimePicker – Date & time selection

Hive & hive_flutter – Local database

Material widgets – UI styling and theming

<h1>🎨 UI & Design</h1>

Material Design-based layout

Primary action color: Colors.blue.shade900

Rounded containers and spacing for clarity

Error states highlighted in red for invalid inputs

Responsive layout for different screen sizes

<h1>🏗️ Architectural Overview</h1>

project_root/
│
├── assets/
│   ├── fonts/              # Custom fonts used in the app
│   │   ├── poppins/
│   │   ├── dm_sans/
│   │   └── ...
│   └── images/             # Static images
│
├── lib/
│   ├── screens/            # App screens (UI)
│   │   ├── auth_screen.dart
│   │   ├── home_screen.dart
│   │   ├── add_task_screen.dart
│   │   └── upload_profile_screen.dart
│   │
│   ├── widgets/            # Reusable UI components
│   │   ├── task_container.dart
│   │   ├── date_container.dart
│   │   ├── app_button.dart
│   │   └── app_user.dart
│   │
│   ├── models/             # Data models
│   │   └── task_model.dart
│   │
│   ├── services/           # Data handling (Hive, SharedPreferences)
│   │
│   └── main.dart           # Entry point


<h1>⚙️ Installation & Setup</h1>
1️⃣ Clone the repository
git clone https://github.com/your-username/taskati.git

2️⃣ Install dependencies
flutter pub get

3️⃣ Run the app
flutter run

<h1>📱 Requirements</h1>

Flutter SDK

Dart SDK

Android Studio / VS Code

Android or iOS emulator (or physical device)




https://github.com/user-attachments/assets/7b575566-bef8-4dfb-9726-fa7e2a881a47



