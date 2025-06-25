import 'package:go_router/go_router.dart';
import 'package:rain_for_sleep/features/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => SplashScreen())],
);
