import 'package:rfw/rfw.dart';
import 'package:store_app/components/lesson_of_the_day.dart';
import 'package:store_app/components/promo_banner.dart';
import 'package:store_app/components/promocode_banner.dart';
import 'package:store_app/components/text_and_description.dart';
import 'package:store_app/components/trombone_image.dart';
import 'package:store_app/components/trombone_positions.dart';
import 'package:store_app/components/welcome_text.dart';
import 'package:store_app/components/youtube_video.dart';

import 'new_badge.dart';

WidgetLibrary localComponentsLibrary() {
  return LocalWidgetLibrary(
    {
      'NewBadge': (context, source) {
        return NewBadge(
          child: source.child(
            ['child'],
          ),
        );
      },
      'WelcomeText': (context, source) => const WelcomeText(),
      'TromboneNotesWidget': (context, source) => TromboneNotesWidget(),
      'TromboneImage': (context, source) => const TromboneImage(),
      'LessonOfTheDay': (context, source) => const LessonOfTheDay(),
      'PromocodeBanner': (context, source) => PromocodeBanner(
            couponCode: source.v(['couponCode']) ?? '',
          ),
      'YoutubeVideo': (context, source) => YoutubeVideo(
            url: source.v(['url']) ?? '',
          ),
      'TextAndDescription': (context, source) => TextAndDescription(
            title: source.v(['title']) ?? '',
            description: source.v(['description']) ?? '',
          ),
      'PromoBanner': (context, source) => PromoBanner(
            message: source.v(['message']) ?? '',
            ctaText: source.v(['ctaText']) ?? '',
            link: source.v(['link']) ?? '',
          ),
    },
  );
}
