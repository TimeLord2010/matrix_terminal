import 'package:flutter/widgets.dart';

class MatrixTerminal extends StatefulWidget {
  const MatrixTerminal({
    super.key,
    required this.characterStream,
    this.style,
    this.textColor = const Color.fromARGB(255, 107, 255, 119),
  });

  final Stream<String> characterStream;
  final Color textColor;
  final TextStyle? style;

  @override
  State<MatrixTerminal> createState() => _MatrixTerminalState();
}

class _MatrixTerminalState extends State<MatrixTerminal>
    with TickerProviderStateMixin {
  StringBuffer buffer = StringBuffer();
  late AnimationController _cursorController;
  late Animation<double> _cursorAnimation;

  Stream<String> get answerStream => widget.characterStream;
  Color get textColor => widget.textColor;

  @override
  void initState() {
    super.initState();

    answerStream.listen((character) {
      buffer.write(character);
      setState(() {});
    });

    _cursorController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _cursorAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _cursorController, curve: Curves.easeInOut),
    );
    _cursorController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: AnimatedBuilder(
        animation: _cursorAnimation,
        builder: (context, child) {
          return RichText(
            text: TextSpan(
              style: TextStyle(
                color: textColor,
                shadows: [Shadow(color: textColor, blurRadius: 3)],
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'packages/matrix_terminal/CourierNew',
                fontStyle: FontStyle.normal,
              ).merge(widget.style),
              children: [
                TextSpan(text: buffer.toString()),
                _cursor(),
              ],
            ),
          );
        },
      ),
    );
  }

  TextSpan _cursor() {
    return TextSpan(
      text: ' █',
      style: TextStyle(
        color: textColor.withValues(alpha: _cursorAnimation.value),
        shadows: [
          Shadow(
            color: textColor.withValues(alpha: _cursorAnimation.value),
            blurRadius: 15,
          ),
          Shadow(
            color: textColor.withValues(alpha: _cursorAnimation.value * 0.8),
            blurRadius: 25,
          ),
          Shadow(
            color: textColor.withValues(alpha: _cursorAnimation.value * 0.6),
            blurRadius: 35,
          ),
        ],
      ),
    );
  }
}
