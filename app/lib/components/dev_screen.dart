import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_app/components/countdown.dart';
import 'package:store_app/components/cta_button.dart';
import 'package:store_app/components/lesson_of_the_day.dart';
import 'package:store_app/components/promo_banner.dart';
import 'package:store_app/components/promocode_banner.dart';
import 'package:store_app/components/text_and_description.dart';
import 'package:store_app/components/trombone_image.dart';
import 'package:store_app/components/trombone_positions.dart';
import 'package:store_app/components/welcome_text.dart';
import 'package:store_app/components/youtube_video.dart';

import 'new_badge.dart';

class DevScreen extends HookConsumerWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text('Dev Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeText(),
            const SizedBox(height: 8),
            const TromboneImage(),
            const PromocodeBanner(),
            const CtaButton(ctaText: 'Open home', link: '/home'),
            const CtaButton(ctaText: 'Open videos', link: '/videos'),
            const PromoBanner(
                message: 'Did you practice today?',
                ctaText: 'YES',
                link: 'https://google.com'),
            const LessonOfTheDay(),
            const TextAndDescription(
                title: 'Black Friday is Coming',
                description: 'Please be prepared'),
            CountdownWidget(
              imageUrl:
                  'https://images.unsplash.com/photo-1716841670208-b08fc68993e5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dHJvbWJvbmV8ZW58MHx8MHx8fDA%3D',
              targetDate: DateTime(2024, 11, 12, 21),
            ),
            const YoutubeVideo(
              url: 'https://www.youtube.com/watch?v=l3XuJ7TztVg',
            ),
            TromboneNotesWidget(),
            const NewBadge(
              child: SizedBox(
                height: 200,
                child: Placeholder(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
