import 'package:flutter/widgets.dart';

class NewBadge extends StatelessWidget {
  const NewBadge({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 100,
              child: Image.asset(
                'assets/new_badge.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
