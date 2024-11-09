import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeText extends HookConsumerWidget {
  const WelcomeText({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning ☀️';
    } else if (hour < 18) {
      return 'Good Day 🌤️';
    } else {
      return 'Good Evening 🌃';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = _getGreeting();
    const quote = 'Music is the universal language of mankind.';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          Text(
            quote,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
