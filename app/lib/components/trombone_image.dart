import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TromboneImage extends HookConsumerWidget {
  const TromboneImage({super.key});

  @override
  Widget build(context, ref) {
    return Image.asset('assets/trombone.jpg');
  }
}
