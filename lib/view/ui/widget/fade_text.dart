import 'package:flutter/material.dart';

class FadeText extends StatelessWidget {
  final Widget child;
  final Duration delay;

  const FadeText({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 500),
  });

  Future<bool> _delayedVisibility() async {
    await Future.delayed(delay);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _delayedVisibility(),
      builder: (context, snapshot) {
        final visible = snapshot.connectionState == ConnectionState.done;
        return AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: child,
        );
      },
    );
  }
}
