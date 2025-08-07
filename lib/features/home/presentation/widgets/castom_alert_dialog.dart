import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CastomAlertDialog extends HookConsumerWidget {
  const CastomAlertDialog({super.key, required this.isShowSettings});

  final ValueNotifier<bool> isShowSettings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupValue = useState<String>('ru');

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
            const Text(
              'Языкь',
              style: TextStyle(fontSize: 20, color: Colors.white),
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
                  GestureDetector(
                    onTap: () {
                      groupValue.value = 'tg';
                      context.setLocale(const Locale('tg'));
                      isShowSettings.value = false;
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'tg',
                          groupValue: groupValue.value,
                          onChanged: (value) {
                            groupValue.value = 'tg';
                            context.setLocale(const Locale('tg'));
                            isShowSettings.value = false;
                          },

                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.blue;
                            }
                            return Colors.white;
                          }),
                        ),
                        const Text(
                          'Точики',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      groupValue.value = 'ru';
                      context.setLocale(const Locale('ru'));
                      isShowSettings.value = false;
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'ru',
                          groupValue: groupValue.value,
                          onChanged: (value) {
                            groupValue.value = 'ru';
                            context.setLocale(const Locale('ru'));
                            isShowSettings.value = false;
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.blue;
                            }
                            return Colors.white;
                          }),
                        ),
                        const Text(
                          'Русский',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      groupValue.value = 'en';
                      context.setLocale(const Locale('en'));
                      isShowSettings.value = false;
                    },
                    child: Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'en',
                          groupValue: groupValue.value,
                          onChanged: (value) {
                            groupValue.value = 'en';
                            context.setLocale(const Locale('en'));
                            isShowSettings.value = false;
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.blue;
                            }
                            return Colors.white;
                          }),
                        ),
                        const Text(
                          'English',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
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
