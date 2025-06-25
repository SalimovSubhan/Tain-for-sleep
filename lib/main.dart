import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/router/router.dart';

void main() {
  runApp(
    EasyLocalization(
      path: 'assets/transitions',
      supportedLocales: [Locale('an'), Locale('ru')],
      fallbackLocale: Locale('ru'),
      child: ProviderScope(child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Material App',
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
