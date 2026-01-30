🗂️ Taskati – Task Management App (Flutter)
📌 Overview

Taskati is a lightweight and efficient task management application built with Flutter.
It helps users organize daily tasks with precise scheduling, validation, and persistent local storage.

The app is fully offline-capable and designed with a clean, modern UI following Material Design principles.

🚀 Features

Create tasks with title, description, date, start time, and end time

Strong form validation with clear error feedback

Random task color assignment for visual distinction

Swipe-to-delete task functionality

Persistent local storage using Hive

Clean and minimal UI focused on usability

🧠 Local Storage (Hive)

Hive is used as the local NoSQL database

Tasks are stored on-device for fast access and offline usage

Data remains saved even after app restarts

Hive provides high performance without requiring SQL or internet access

🧩 Widgets & Packages Used

Scaffold – App layout structure

AppBar – Screen headers

Form & TextFormField – User input with validation

ListView.separated – Displaying task lists

Dismissible – Swipe-to-delete tasks

ElevatedButton – User actions

showDatePicker & showTimePicker – Date & time selection

Hive & hive_flutter – Local database

Material widgets – UI styling and theming

🎨 UI & Design

Material Design-based layout

Primary action color: Colors.blue.shade900

Rounded containers and spacing for clarity

Error states highlighted in red for invalid inputs

Responsive layout for different screen sizes

📁 Project Structure
lib/
│── main.dart
│── taskati.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── add_task_screen.dart
│
├── widgets/
│   ├── task_card.dart
│   ├── app_button.dart
│
├── models/
│   ├── task_model.dart
│
├── services/
│   ├── hive_service.dart
│
├── utils/
│   ├── colors.dart
│
assets/
│── fonts/
│── images/


⚙️ Installation & Setup
1️⃣ Clone the repository
git clone https://github.com/your-username/taskati.git

2️⃣ Install dependencies
flutter pub get

3️⃣ Run the app
flutter run

📱 Requirements

Flutter SDK

Dart SDK

Android Studio / VS Code

Android or iOS emulator (or physical device)


https://github.com/user-attachments/assets/6b87decd-9a24-43ec-b41c-f4c5c4e97ac6

