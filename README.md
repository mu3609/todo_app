Flutter Todo App

A beautiful, modern **Todo App** built with Flutter using **local SQLite database (sqflite)**. No Firebase, no internet required — everything is stored safely on your device.

---

## ✨ Features

- 🔐 **Register & Login** — Create an account and sign in securely
- 💾 **Local Database** — All data stored on device using sqflite
- 🔄 **Auto Login** — Stay logged in even after closing the app
- ✅ **Complete Tasks** — Tap the circle to mark tasks as done (strikethrough)
- 🗑️ **Delete Tasks** — Remove tasks with a confirmation dialog
- ✔️ **Form Validation** — Email format check, password min 6 characters
- 🌙 **Dark Theme** — Beautiful dark UI with teal accent color
- 🚀 **Splash Screen** — Animated logo on startup

---

## 📸 Screens

| Splash Screen | Login Screen | Home Screen |
|---|---|---|
| Animated logo + app name | Login & Register toggle | Welcome + navigation |

| Task Screen | Add Task Screen |
|---|---|
| List of all tasks with toggle & delete | Add new task with validation |

---

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| **Flutter** | UI Framework |
| **Dart** | Programming Language |
| **sqflite** | Local SQLite Database |
| **shared_preferences** | Auto-login (session storage) |
| **path** | Database file path helper |

---

## 📁 Project Structure

```
lib/
├── main.dart                  # App entry point
├── db/
│   └── database_helper.dart   # SQLite database logic
└── screens/
    ├── splash_screen.dart     # Animated splash screen
    ├── login_screen.dart      # Login & Register screen
    ├── home_screen.dart       # Home dashboard
    ├── task_screen.dart       # Task list screen
    └── add_task_screen.dart   # Add new task screen
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Android Studio or VS Code
- Android Emulator or physical device

### Installation

**1. Clone the repository**
```bash
git clone https://github.com/your-username/todo_app.git
cd todo_app
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Run the app**
```bash
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.3
  shared_preferences: ^2.2.2
```

---

## 🗄️ Database Schema

### Users Table
| Column | Type | Description |
|---|---|---|
| id | INTEGER | Primary key |
| email | TEXT | Unique email address |
| password | TEXT | User password |

### Tasks Table
| Column | Type | Description |
|---|---|---|
| id | INTEGER | Primary key |
| user_email | TEXT | Owner of the task |
| task | TEXT | Task description |
| is_done | INTEGER | 0 = pending, 1 = completed |
| created_at | TEXT | Creation timestamp |

---

## 🎨 UI Theme

| Element | Color |
|---|---|
| Background | `#0D1B2A` → `#1B2838` (dark gradient) |
| Accent | `#00C9A7` (teal) |
| Secondary Accent | `#0096C7` (blue) |
| Text | White / White38 |
| Error | Red Accent |

---

## 👨‍💻 How to Use

1. **Open the app** — Splash screen will appear for 3 seconds
2. **Register** — Tap "Register" link and create a new account
3. **Login** — Enter your email and password to sign in
4. **Add Tasks** — Tap the "Add Task" button on the task screen
5. **Complete Tasks** — Tap the circle next to any task to mark it done
6. **Delete Tasks** — Tap the delete icon and confirm to remove a task
7. **Logout** — Tap the logout icon on the home screen

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙋‍♂️ Author

Made with ❤️ using Flutter
