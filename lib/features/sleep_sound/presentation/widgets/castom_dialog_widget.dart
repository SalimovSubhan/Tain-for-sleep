import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/widgets/radio_with_text_widget.dart';

class CastomDialogWidget extends HookConsumerWidget {
  final ValueNotifier<int> switchTimer;
  final ValueNotifier<bool> showCastomDialog;
  final ValueNotifier<int?> groupValueForCastomDialog;
  const CastomDialogWidget({
    super.key,
    required this.showCastomDialog,
    required this.switchTimer,
    required this.groupValueForCastomDialog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withAlpha(125),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 80, bottom: 60),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(150),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Настроить длительность таймера',
              style: TextStyle(
                color: Color.fromARGB(255, 213, 209, 209),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 10),
            RadioWithTextWidget(
              title: 'Нет таймера',
              value: 0,
              onTap: () {
                groupValueForCastomDialog.value = 0;

                showCastomDialog.value = false;
                switchTimer.value = 0;
              },
              isSelected: groupValueForCastomDialog.value == 0,
            ),

            RadioWithTextWidget(
              title: 'Настройка длительност',
              value: 2,
              onTap: () async {
                final piker = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (piker != null &&
                    piker.hour >= TimeOfDay.now().hour &&
                    piker.minute > TimeOfDay.now().minute) {
                  final hour = (piker.hour - TimeOfDay.now().hour) * 3600;
                  final minute = (piker.minute - TimeOfDay.now().minute) * 60;
                  final result = hour + minute;

                  groupValueForCastomDialog.value = 2;
                  showCastomDialog.value = false;
                  switchTimer.value = result;
                }
              },
              isSelected: groupValueForCastomDialog.value == 2,
            ),

            RadioWithTextWidget(
              title: '5 минут',
              value: 300,
              onTap: () {
                groupValueForCastomDialog.value = 300;

                showCastomDialog.value = false;
                switchTimer.value = 300;
              },
              isSelected: groupValueForCastomDialog.value == 300,
            ),

            RadioWithTextWidget(
              title: '10 минут',
              value: 600,
              onTap: () {
                groupValueForCastomDialog.value = 600;
                0;
                showCastomDialog.value = false;
                switchTimer.value = 600;
              },
              isSelected: groupValueForCastomDialog.value == 600,
            ),

            RadioWithTextWidget(
              title: '15 минут',
              value: 900,
              onTap: () {
                groupValueForCastomDialog.value = 900;
                0;
                showCastomDialog.value = false;
                switchTimer.value = 900;
              },
              isSelected: groupValueForCastomDialog.value == 900,
            ),

            RadioWithTextWidget(
              title: '20 минут',
              value: 1200,
              onTap: () {
                groupValueForCastomDialog.value = 1200;
                00;
                showCastomDialog.value = false;
                switchTimer.value = 1200;
              },
              isSelected: groupValueForCastomDialog.value == 1200,
            ),

            RadioWithTextWidget(
              title: '30 минут',
              value: 1800,
              onTap: () {
                groupValueForCastomDialog.value = 1800;
                00;
                showCastomDialog.value = false;
                switchTimer.value = 1800;
              },
              isSelected: groupValueForCastomDialog.value == 1800,
            ),

            RadioWithTextWidget(
              title: '40 минут',
              value: 2400,
              onTap: () {
                groupValueForCastomDialog.value = 2400;
                00;
                showCastomDialog.value = false;
                switchTimer.value = 2400;
              },
              isSelected: groupValueForCastomDialog.value == 2400,
            ),

            RadioWithTextWidget(
              title: '1 час',
              value: 3600,
              onTap: () {
                groupValueForCastomDialog.value = 3600;
                00;
                showCastomDialog.value = false;
                switchTimer.value = 3600;
              },
              isSelected: groupValueForCastomDialog.value == 3600,
            ),

            RadioWithTextWidget(
              title: '2 часа',
              value: 7200,
              onTap: () {
                groupValueForCastomDialog.value = 7200;
                00;
                showCastomDialog.value = false;
                switchTimer.value = 7200;
              },
              isSelected: groupValueForCastomDialog.value == 7200,
            ),

            RadioWithTextWidget(
              title: '4 часа',
              value: 14400,
              onTap: () {
                groupValueForCastomDialog.value = 14400;
                400;
                showCastomDialog.value = false;
                switchTimer.value = 14400;
              },
              isSelected: groupValueForCastomDialog.value == 14400,
            ),

            RadioWithTextWidget(
              title: '8 часа',
              value: 28800,
              onTap: () {
                groupValueForCastomDialog.value = 28800;
                800;
                showCastomDialog.value = false;
                switchTimer.value = 28800;
              },
              isSelected: groupValueForCastomDialog.value == 28800,
            ),
          ],
        ),
      ),
    );
  }
}
