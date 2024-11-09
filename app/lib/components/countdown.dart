import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountdownWidget extends HookConsumerWidget {
  final DateTime targetDate;
  final String imageUrl;

  const CountdownWidget({
    super.key,
    required this.targetDate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLeft = useState(const Duration());

    useEffect(() {
      void updateTime() {
        final now = DateTime.now();
        final difference = targetDate.difference(now);
        timeLeft.value = difference.isNegative ? const Duration() : difference;
      }

      final timer =
          Timer.periodic(const Duration(seconds: 1), (_) => updateTime());
      updateTime();

      return timer.cancel;
    }, []);

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image,
                size: 100, color: Colors.grey);
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black.withOpacity(0.4), // Semi-transparent overlay
          child: Center(
            child: Text(
              '${timeLeft.value.inDays}d ${timeLeft.value.inHours % 24}h ${timeLeft.value.inMinutes % 60}m ${timeLeft.value.inSeconds % 60}s',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
