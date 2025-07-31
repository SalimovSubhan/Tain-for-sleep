import 'package:audio_service/audio_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/core/services/audio_handler.dart';
import 'package:rain_for_sleep/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final audioHandlerProvider = Provider<AudioHandler>((ref) {
  throw UnimplementedError();
});
// ignore: prefer_typing_uninitialized_variables
late final talker;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final audioHandler = await initAudioService();

  final container = ProviderContainer(
    overrides: [audioHandlerProvider.overrideWithValue(audioHandler)],
  );

  talker = TalkerFlutter.init();

  runApp(
    EasyLocalization(
      path: 'assets/transitions',
      supportedLocales: const [Locale('an'), Locale('ru')],
      fallbackLocale: const Locale('ru'),
      child: UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
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
