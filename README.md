# Task Manager App

![Flutter](https://img.shields.io/badge/Framework-Flutter-blue?style=flat-square) ![SQLite](https://img.shields.io/badge/Database-SQLite-orange?style=flat-square) ![MVVM](https://img.shields.io/badge/Architecture-MVVM-green?style=flat-square)

## About

The **Task Manager App** is a simple yet effective mobile application developed using Flutter. It allows users to manage their tasks efficiently with features to add, edit, view, and delete tasks. The app follows the **MVVM (Model-View-ViewModel)** architecture pattern and uses **SQLite** for local data storage, ensuring a structured, scalable, and user-friendly experience.

---

## Features

- **Add New Tasks**: Create tasks with essential details.
- **Edit Tasks**: Modify existing tasks effortlessly.
- **Delete Tasks**: Remove tasks that are no longer needed.
- **View Task List**: Display tasks in a clean and organized ListView.
- **Local Data Storage**: Data persistence using SQLite.
- **State Management**: Efficient state handling using [Provider/Riverpod/Bloc].

---

## App Workflow

### 1. Add a Task  
Users can navigate to the **Add Task** screen, fill out the form with task details, and save it. The task is then added to the SQLite database.

![Add Task](https://img.shields.io/badge/Step-1-blue?style=flat-square)

### 2. View Tasks  
All tasks are displayed in a **ListView**. Users can scroll through their tasks and view them at a glance.

![View Tasks](https://img.shields.io/badge/Step-2-green?style=flat-square)

### 3. Edit a Task  
Tap on a task to navigate to the **Edit Task** screen. Update the task details and save changes, which are immediately reflected in the database.

![Edit Task](https://img.shields.io/badge/Step-3-yellow?style=flat-square)

### 4. Delete a Task  
Swipe left/right on a task or tap the delete button to remove it permanently from the database.

![Delete Task](https://img.shields.io/badge/Step-4-red?style=flat-square)

---

## Architecture

The app is built using the **MVVM** architecture:

- **Model**: Represents the data layer and handles database operations via SQLite.
- **View**: The UI components that users interact with (e.g., forms, buttons, lists).
- **ViewModel**: Acts as a bridge between the View and Model. It processes business logic, manages states, and provides data to the View.

---

## Technologies Used

- **Framework**: Flutter
- **State Management**: [Provider/Riverpod/Bloc]
- **Database**: SQLite (via `sqflite` package)
- **Language**: Dart

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone [repository-link]
   ```

2. Navigate to the project directory:
   ```bash
   cd task_manager_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

---


## Contact

For any questions or feedback, please contact:

- **Name**: Naami Ahmed 
- **Email**: Naamiahmed27@gmail.com
- **LinkedIn**: https://www.linkedin.com/in/naami-ahmed/
