import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/core/services/audio_handler.dart';
import 'package:rain_for_sleep/router/router.dart';
import 'package:rain_for_sleep/shared/shared_aplication/audio_handler_provider.dart';
import 'package:rain_for_sleep/shared/shared_aplication/talker_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('tg')],
      fallbackLocale: const Locale('ru'),
      saveLocale: true,
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

      builder: (context, child) {
        final materialLocale =
            (context.locale.languageCode == 'tg')
                ? const Locale('ru')
                : context.locale;

        return Localizations.override(
          context: context,
          locale: materialLocale,
          child: child!,
        );
      },
    );
  }
}
