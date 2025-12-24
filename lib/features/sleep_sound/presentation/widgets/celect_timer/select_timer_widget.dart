import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/widgets/celect_timer/radio_with_text_widget.dart';

class SelectTimerWidget extends HookConsumerWidget {
  final ValueNotifier<int> switchTimer;
  final ValueNotifier<int?> groupValueForCastomDialog;
  const SelectTimerWidget({
    super.key,
    required this.switchTimer,
    required this.groupValueForCastomDialog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeOptions = [
      _TimeOption(
        title: 'Без таймера',
        seconds: 0,
        subtitle: 'Звук будет играть бесконечно',
        icon: Icons.all_inclusive_rounded,
      ),
      _TimeOption(
        title: '5 минут',
        seconds: 300,
        subtitle: 'Короткий перерыв',
        showLeading: true,
      ),
      _TimeOption(
        title: '10 минут',
        seconds: 600,
        subtitle: 'Быстрая медитация',
        showLeading: true,
      ),
      _TimeOption(
        title: '15 минут',
        seconds: 900,
        subtitle: 'Энергетический сон',
        showLeading: true,
      ),
      _TimeOption(
        title: '20 минут',
        seconds: 1200,
        subtitle: 'Оптимальное время',
        showLeading: true,
      ),
      _TimeOption(
        title: '30 минут',
        seconds: 1800,
        subtitle: 'Глубокая релаксация',
        showLeading: true,
      ),
      _TimeOption(
        title: '45 минут',
        seconds: 2700,
        subtitle: 'Полный цикл сна',
        showLeading: true,
      ),
      _TimeOption(
        title: '1 час',
        seconds: 3600,
        subtitle: 'Полноценный отдых',
        showLeading: true,
      ),
      _TimeOption(
        title: '2 часа',
        seconds: 7200,
        subtitle: 'Длительный сон',
        showLeading: true,
      ),
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(150),
              blurRadius: 40,
              spreadRadius: 2,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Шапка диалога
            Container(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withAlpha(30),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Таймер сна',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),

                  // Кнопка закрытия
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(10),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white.withAlpha(180),
                        size: 22,
                      ),
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Основной контент
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    // Опции времени
                    ...timeOptions.map(
                      (option) => RadioWithTextWidget(
                        title: option.title,
                        subtitle: option.subtitle,
                        value: option.seconds,
                        onTap: () {
                          groupValueForCastomDialog.value = option.seconds;
                          switchTimer.value = option.seconds;
                          Navigator.pop(context);
                        },
                        isSelected:
                            groupValueForCastomDialog.value == option.seconds,
                        showLeadingIcon: option.showLeading,
                        customIcon: option.icon,
                      ),
                    ),

                    // Кастомное время
                    _buildCustomTimeOption(context),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTimeOption(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: const TimeOfDay(hour: 0, minute: 30),
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Color(0xFF2563EB),
                    onPrimary: Colors.white,
                    surface: Color(0xFF111827),
                    onSurface: Colors.white,
                    background: Color(0xFF111827),
                  ),
                  dialogBackgroundColor: const Color(0xFF111827),
                  timePickerTheme: TimePickerThemeData(
                    backgroundColor: const Color(0xFF111827),
                    dialBackgroundColor: const Color(0xFF1F2937),
                    dialTextColor: Colors.white,
                    entryModeIconColor: Colors.white.withAlpha(150),
                    hourMinuteTextColor: Colors.white,
                    dayPeriodTextColor: Colors.white,
                    dayPeriodColor: const Color(0xFF1F2937),
                    hourMinuteColor: const Color(0xFF1F2937),
                    helpTextStyle: TextStyle(
                      color: Colors.white.withAlpha(180),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null) {
            final seconds = (picked.hour * 3600) + (picked.minute * 60);
            if (seconds > 0) {
              groupValueForCastomDialog.value = -1;
              switchTimer.value = seconds;
              Navigator.pop(context);
            }
          }
        },
        borderRadius: BorderRadius.circular(16),
        highlightColor: const Color(0xFF2563EB).withAlpha(20),
        splashColor: const Color(0xFF2563EB).withAlpha(10),
        child: Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF2563EB).withAlpha(80),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.edit_calendar_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Свое время',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Выберите любое время вручную',
                      style: TextStyle(
                        color: Colors.white.withAlpha(140),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withAlpha(120),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeOption {
  final String title;
  final int seconds;
  final String subtitle;
  final bool showLeading;
  final IconData? icon;

  _TimeOption({
    required this.title,
    required this.seconds,
    required this.subtitle,
    this.showLeading = false,
    this.icon,
  });
}
