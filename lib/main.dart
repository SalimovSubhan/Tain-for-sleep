import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rain_for_sleep/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.subhon.rain',
    androidNotificationChannelName: 'Audio Playback',
    androidNotificationOngoing: true,
    notificationColor: Colors.blue,
    androidStopForegroundOnPause: true,
  );

  runApp(
    EasyLocalization(
      path: 'assets/transitions',
      supportedLocales: const [Locale('an'), Locale('ru')],
      fallbackLocale: const Locale('ru'),
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Дождь для сна',
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
