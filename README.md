# Flutter Widget Gallery

An interactive Flutter catalog of commonly used Material widgets and Flutter
UI patterns. Each example is implemented as a small, focused widget so it can
be read, run, and adapted in another Flutter project.

The gallery opens on a scrollable catalog screen. Interactive examples can be
tested directly in the app, including state changes, navigation, animations,
and asynchronous data updates.

## Widget examples

| Example | What it demonstrates |
| --- | --- |
| `Stepper` | Moving between steps, selecting a step, and handling continue/cancel actions |
| `FittedBox` | Comparing constrained text with and without `FittedBox` scaling |
| Adaptive controls | Platform-adaptive sliders, switches, progress indicators, and icons |
| `Hero` | Animated transitions from compact cards to a detail screen |
| `StreamBuilder` | Loading, streamed values, completion, and error states |
| `ChoiceChip` | Selecting and displaying a chip state |
| `ExpansionTile` | Expanding a section containing list items |
| Sliver screen | Navigating to a separate screen for sliver-based layouts |
| `showTimePicker` | Opening a time picker and displaying the selected time |

The examples are located in [`lib/widgets/`](C:/Project/Flutter/flutter_widget_gallery/lib/widgets/).
The main catalog and its search action are defined in
[`lib/screen/home_screen.dart`](C:/Project/Flutter/flutter_widget_gallery/lib/screen/home_screen.dart).

## Requirements

- Flutter SDK with Dart SDK `3.12.0` or newer
- A configured Flutter device, emulator, or desktop target

## Getting started

Clone the repository and start the app:

```bash
git clone https://github.com/AbdelkaderBarhoumi21/flutter_widget_gallery.git
cd flutter_widget_gallery
flutter pub get
flutter run
```

To see the available devices:

```bash
flutter devices
```

## Development commands

```bash
# Check the project
flutter analyze

# Run the test suite
flutter test

# Format Dart files
dart format .
```

## Project structure

```text
lib/
├── main.dart
├── screen/
│   ├── home_screen.dart
│   └── sliver_screen.dart
└── widgets/
    ├── adaptive_widget.dart
    ├── choice_chip_widget.dart
    ├── expansion_tile_widget.dart
    ├── fitted_box_widget.dart
    ├── hero_widget.dart
    ├── show_time_picker_widget.dart
    ├── stepper_widget.dart
    └── stream_builder_widget.dart
```

## Adding an example

1. Create a focused widget in `lib/widgets/`.
2. Keep the example interactive when the widget has state or callbacks.
3. Add a section title and the widget to `HomeScreen` in
   `lib/screen/home_screen.dart`.
4. Add the example to the widget table in this README.
5. Run `flutter analyze` and `flutter test` before opening a pull request.

## Contributing

Contributions that add clear, self-contained Flutter widget examples are
welcome. Please keep examples easy to understand, avoid unnecessary
dependencies, and include any behavior-specific notes in the README.

## Resources

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter widget catalog](https://docs.flutter.dev/ui/widgets)
- [Dart documentation](https://dart.dev/guides)
