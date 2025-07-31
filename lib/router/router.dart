import 'package:go_router/go_router.dart';
import 'package:rain_for_sleep/features/home/presentation/home_screen.dart';
import 'package:rain_for_sleep/features/splash_screen.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/screens/timer_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/timer_screen',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final title = extra['title'];
        final image = extra['image'];
        final sound = extra['sound'];
        return TimerScreen(image: image, title: title, sound: sound);
      },
    ),
  ],
);
