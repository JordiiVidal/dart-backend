# Dart
## Fundaments Dart
- Static type programming language
```dart
String helloWorld = 'Hello World';
dynamic name = 2;
```
- Compiled programming language
1. AOT
2. JIT

## Dart Frog (Backend)
```dart
dart pub global activate dart_frog_cli
dart_frog dev
```
## JSON Serializable
1. One-time code generation
```dart
dart run build_runner build --delete-conflicting-outputs
```
1. Generating code continously
```dart
dart run build_runner watch --delete-conflicting-outputs
```