import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/home/presentation/screens/home_screen.dart';

class SetingsAlertDialog extends HookConsumerWidget {
  const SetingsAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = context.locale.languageCode;
    final groupValue = useState<String?>(currentLocale);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E88E5), Color(0xFF0D47A1)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(100),
              blurRadius: 30,
              spreadRadius: 5,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Шапка диалога
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language'.tr(),
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(25),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Разделитель
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white.withAlpha(50),
            ),

            // Опции языка
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withAlpha(40),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Таджикский
                    _buildLanguageTile(
                      context: context,
                      ref: ref,
                      localeCode: 'tg',
                      title: 'Тоҷикӣ',
                      groupValue: groupValue,
                    ),

                    // Разделитель
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white.withAlpha(30),
                    ),

                    // Русский
                    _buildLanguageTile(
                      context: context,
                      ref: ref,
                      localeCode: 'ru',
                      title: 'Русский',
                      groupValue: groupValue,
                    ),

                    // Разделитель
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white.withAlpha(30),
                    ),

                    // Английский
                    _buildLanguageTile(
                      context: context,
                      ref: ref,
                      localeCode: 'en',
                      title: 'English',
                      groupValue: groupValue,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required WidgetRef ref,
    required String localeCode,
    required String title,
    required ValueNotifier<String?> groupValue,
  }) {
    final isSelected = groupValue.value == localeCode;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          groupValue.value = localeCode;
          await context.setLocale(Locale(localeCode));
          ref.read(checkLanguage.notifier).state++;
          if (context.mounted) context.pop();
        },
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withAlpha(30),
        highlightColor: Colors.white.withAlpha(15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Row(
            children: [
              // Индикатор выбора
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        isSelected ? Colors.white : Colors.white.withAlpha(120),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: isSelected ? 14 : 0,
                    height: isSelected ? 14 : 0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Название языка
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ),

              // Флаг языка (опционально)
              if (localeCode == 'tg')
                Container(
                  width: 32,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else if (localeCode == 'ru')
                Container(
                  width: 32,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
              else if (localeCode == 'en')
                Container(
                  width: 32,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
