import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetingsAlertDialog extends HookConsumerWidget {
  const SetingsAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = context.locale.languageCode;
    final groupValue = useState<String?>(currentLocale);

    return Dialog(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 130, 184, 228),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language'.tr(),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 122, 208),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //tg
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'tr';
                      await context.setLocale(const Locale('tr'));
                      if (!context.mounted) return;
                      context.pop();
                    },
                    value: 'tr',
                    title: 'Точики',
                    groupValue: groupValue.value ?? '',
                  ),
                  //ru
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'ru';
                      await context.setLocale(const Locale('ru'));
                      if (!context.mounted) return;
                      context.pop();
                    },
                    value: 'ru',
                    title: 'Русский',
                    groupValue: groupValue.value ?? '',
                  ),
                  //en
                  languageOption(
                    onTap: () async {
                      groupValue.value = 'en';
                      await context.setLocale(const Locale('en'));
                      if (!context.mounted) return;
                      context.pop();
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
              return Colors.green;
            }
            return Colors.white;
          }),
        ),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
      ],
    ),
  );
}
