import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/home_screen.dart';
import 'package:rain_for_sleep/features/splash_screen.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/screens/sleep_sound_screen.dart';
import 'package:rain_for_sleep/shared/shared_aplication/talker_provider.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  initialLocation: '/',
  observers: [TalkerRouteObserver(talker)],
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/timer_screen',
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final soundCard = extra['soundCard'];
        return CustomTransitionPage(
          child: Material(child: SleepSoundScreen(soundCard: soundCard)),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
    ),
  ],
);

class AppNavigator {
  static void go(BuildContext context, String path, {Object? extra}) {
    debugPrint("🚀 GO: $path");
    context.go(path, extra: extra);
  }

  static void push(BuildContext context, String path, {Object? extra}) {
    debugPrint("➡️ PUSH: $path");
    context.push(path, extra: extra);
  }

  static void pushTimerScreen({
    required BuildContext context,
    required SoundCardDto soundCard,
  }) {
    debugPrint("➡️ PUSH: /delivery_status");
    context.push('/timer_screen', extra: {'soundCard': soundCard});
  }
}
