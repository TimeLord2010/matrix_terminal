# Matrix Terminal

A Flutter widget that renders a stream of characters with a Matrix-style green glow effect. Set the background to black for the authentic Matrix look.

<img width="611" height="354" alt="image" src="https://github.com/user-attachments/assets/44ea4415-9c63-412a-a458-a54b4f619cb2" />

## Features

- Stream-based character rendering with typing animation
- Matrix-style green glow effect with multiple shadow layers
- Animated blinking cursor
- Customizable text color and style
- Built-in Courier New font for authentic terminal appearance

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  matrix_terminal: VERSION
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:matrix_terminal/matrix_terminal.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.black, // Black background for authentic Matrix look
        child: MatrixTerminal(
          characterStream: yourCharacterStream(),
        ),
      ),
    );
  }
}

// Example character stream
Stream<String> yourCharacterStream() async* {
  var text = "Welcome to the Matrix...";
  for (int i = 0; i < text.length; i++) {
    await Future.delayed(Duration(milliseconds: 50));
    yield text[i];
  }
}
```

## Parameters

- `characterStream` (required): A `Stream<String>` that provides characters to display
- `textColor`: Color of the text (default: Matrix green `Color.fromARGB(255, 107, 255, 119)`)
- `style`: Optional `TextStyle` to customize font properties

## Example

The example demonstrates a simple implementation with a mock AI response stream:

```dart
Stream<String> mockAiAnswser() async* {
  var answer = 'Machine learning is a subset of artificial intelligence...';
  for (int i = 0; i < answer.length; i++) {
    await Future.delayed(Duration(milliseconds: 25));
    yield answer[i];
  }
}
```

## License

This project is open source and available under the MIT License.
