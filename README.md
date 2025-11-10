# cube_timer_oficial

## Overview

cube_timer_oficial is a cross-platform Rubik's Cube timer and statistics app built with Flutter. It helps speedcubers track their solves, analyze performance, and manage puzzle categories. The app supports iOS and Android platforms

- For web and desktop I'm still minding the UI changes\*.

## Architecture

_cube_timer_oficial_ uses a modular, scalable architecture built on Flutter and Riverpod.

- **State Management**: Riverpod providers manage app state, including navigation, theme, and data persistence.

- **Feature Organization**: The codebase is organized by features (e.g., timer, menu, theme), with platform-specific UI components for iOS and Android.

- **Theme System**: The app’s theme logic is centralized in a single provider (themeNotifierProvider), which controls color schemes, text styles, and dark mode across all platforms.

- **Database**: Drift (SQLite) is used for local data storage, enabling fast and reliable solve tracking and statistics.

- **Navigation**: A custom navigation handler abstracts route changes and dialog presentation, adapting to Material and Cupertino conventions.

## Packages & SDKs

- **Flutter SDK**: >=3.10.0 <4.0.0
- **flutter_riverpod**: State management
- **drift**: Local database (SQLite)
- **path_provider**: File system access
- **modal_bottom_sheet**: Custom modals
- **cupertino_icons**: iOS icons
- **shared_preferences**: to save theme and category/cube-type preferences

See [`pubspec.yaml`](pubspec.yaml) for the full list.

## Themes

_cube_timer_oficial_ as the original idea from **Twisty timer** offers a rich/customizable theme system:

- **Color Themes**: Defined in app_theme.dart as ColorAppTheme, each theme includes a pair of background colors, app-bar color, bottom-bar color. Themes change both light and dark modes.

- **Text Themes**: The app provides a variety of text color styles (TextTheme).

- **Dynamic Switching**: Users can change color and text themes at runtime. The theme provider updates all UI elements instantly, ensuring a consistent experience (Twisty timer still has a bad perfomance when you try to switch themes quickly)

- **Platform Adaptation**: The same theme data is used for both Material (Android/desktop) and Cupertino (iOS) widgets, with platform-specific rendering for dialogs, navigation bars, and controls.

### Theme Example:

```dart
ColorAppTheme(
  isDarkmode: true,
  bgPatternColor: ColorBackgroundPair(
    primaryColor: Color(0xFF1959FF),
    secondaryColor: Color(0xFF3b12ff),
  ),
  appBarColor: Color(0xff0045f6),
  bottomBarColor: Color(0xff2900ef),
  name: 'Hazy\nBlues',
)
```

### Text Theme Example:

```dart
TextTheme(colorText: Color(0xFFFF1744), name: "Pessoa")
```

### Customization

- Users can select from over 20 color themes and 15 text styles. [See more in `app_theme.dart`](https://github.com/jimhuertas123/cube-timer-oficial/blob/main/lib/shared/theme/app_theme.dart)

## Future Feature: Scramble Generation

A future update will introduce scramble generation for each puzzle type. The scramble engine will use a server and `.jar` extracted from the official [Tnoodle-lib](https://github.com/thewca/tnoodle-lib).
