import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/core/services/shared_preferens_sevice.dart';

class CastomAlertDialog extends HookConsumerWidget {
  const CastomAlertDialog({super.key, required this.isShowSettings});

  final ValueNotifier<bool> isShowSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = context.locale.languageCode;
    final groupValue = useState<String?>(currentLocale);

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(89, 0, 0, 0),
      alignment: Alignment.center,
      child: Container(
        width: 200,
        height: 210,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 130, 184, 228),

          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              'Language'.tr(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 122, 208),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ////////////////////////////////////////////tg
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'tg';
                      context.setLocale(const Locale('tg'));
                      isShowSettings.value = false;
                      await ref
                          .read(prefsServiseProvider)
                          .setLanguage(value: 'tg');
                    },
                    value: 'tg',
                    title: 'Точики',
                    groupValue: groupValue.value ?? '',
                  ),
                  ////////////////////////////////////////////ru
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'ru';
                      context.setLocale(const Locale('ru'));
                      isShowSettings.value = false;
                      await ref
                          .read(prefsServiseProvider)
                          .setLanguage(value: 'ru');
                    },
                    value: 'ru',
                    title: 'Русский',
                    groupValue: groupValue.value ?? '',
                  ),
                  /////////////////////////////////////////////en
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'en';
                      context.setLocale(const Locale('en'));
                      isShowSettings.value = false;
                      await ref
                          .read(prefsServiseProvider)
                          .setLanguage(value: 'en');
                    },
                    value: 'en',
                    title: 'English',
                    groupValue: groupValue.value ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget languageOption({
  void Function()? onTap,
  required String groupValue,
  required String value,
  required String title,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Radio(
          activeColor: Colors.blue,
          value: value,
          groupValue: groupValue,
          onChanged: (value) {},

          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blue;
            }
            return Colors.white;
          }),
        ),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
      ],
    ),
  );
}
