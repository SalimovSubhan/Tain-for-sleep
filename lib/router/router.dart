import 'package:go_router/go_router.dart';
import 'package:rain_for_sleep/features/home/presentation/home_screen.dart';
import 'package:rain_for_sleep/features/splash_screen.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/screens/tainmer_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/timer_screen',
      builder: (context, state) => TainmerScreen(),
    ),
  ],
);
