# Flutter Assessment App
***
**Submission for AQWise SDN BHD**
**Duration : 5++ Days**

## What This App Does

- **Home Screen**: Navigation hub with buttons
- **Posts List**: Shows posts from JSONPlaceholder API
- **Post Detail**: View full post and able to bookmark it
- **Bookmarks**: View saved bookmarks
- **Theme Toggle**: Switch between light/dark mode

## How to Run

1. **Install dependencies:**
   ```
   flutter pub get
   ```
2. **Run the app:**
   ```
   flutter run
   ```
   Or press F5 in VS Code / play button in Android Studio

**If errors:**
```
flutter clean
flutter pub get
flutter run
```

## What I Learned

1. **API**: Using `http` package to fetch data, parsing JSON by `dart:convert`
2. **State Management**: Using `StatefulWidget` and `setState()` to update UI
3. **Navigation**: Moving between screens with `Navigator.push()` and passing data
4. **Local Storage**: Saving bookmarks and theme preferences using `shared_preferences`
5. **Theme**: Creating light/dark themes and persisting user preference
6. **Tween**: Using `AnimatedContainer` for smooth transitions
7. **usematerial3**: https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html

## Issues Faced

1. **shared_preferences** : App crashed/not working after adding `shared_preferences` package. Had to restart device
2. **Wrong Spelling** 
3. **IDE Showing Wrong Errors** : Code was correct but IDE showed red error lines. So had to Restarted IDE and ran `flutter clean`


