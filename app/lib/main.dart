import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:store_app/app_layouts/app_layouts_service.dart';

import 'dynamic_screen.dart';

void main() async {
  final cf = CloudflareAppLayoutsService();
  final layouts = await cf.getAppLayouts();
  runApp(
    App(
      layouts: layouts,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.layouts,
  });

  final AppLayouts layouts;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Dynamic App',
        routes: {
          // '/dev': (context) => const DevScreen(),
          '/videos': (context) => DynamicScreen(config: layouts.videos!)
        },
        // routerConfig: goRouter,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/videos',
      ),
    );
  }
}
