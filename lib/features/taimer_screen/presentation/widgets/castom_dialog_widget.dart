import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/providers/providers.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/widgets/radio_with_text_widget.dart';

class CastomDialogWidget extends HookConsumerWidget {
  final ValueNotifier<bool> showDialog;
  final ValueNotifier<int> startSecond;
  const CastomDialogWidget({
    super.key,
    required this.startSecond,
    required this.showDialog,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupValue = useState<int?>(ref.watch(secondprovider));

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withAlpha(125),
      padding: EdgeInsets.only(left: 15, right: 15, top: 80, bottom: 60),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(150),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Настроить длительность таймера',
              style: TextStyle(
                color: const Color.fromARGB(255, 213, 209, 209),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            RadioWithTextWidget(
              title: 'Нет таймера',
              value: 0,
              onTap: () {
                groupValue.value = 0;
                startSecond.value = 0;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 0;
              },
              isSelected: groupValue.value == 0,
            ),

            RadioWithTextWidget(
              title: 'Настройка длительност',
              value: 2,
              onTap: () {
                groupValue.value = 2;
                startSecond.value = 2;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 2;
              },
              isSelected: groupValue.value == 2,
            ),

            RadioWithTextWidget(
              title: '5 минут',
              value: 300,
              onTap: () {
                groupValue.value = 300;
                startSecond.value = 300;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 300;
              },
              isSelected: groupValue.value == 300,
            ),

            RadioWithTextWidget(
              title: '10 минут',
              value: 600,
              onTap: () {
                groupValue.value = 600;
                startSecond.value = 600;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 600;
              },
              isSelected: groupValue.value == 600,
            ),

            RadioWithTextWidget(
              title: '15 минут',
              value: 900,
              onTap: () {
                groupValue.value = 900;
                startSecond.value = 900;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 900;
              },
              isSelected: groupValue.value == 900,
            ),

            RadioWithTextWidget(
              title: '20 минут',
              value: 1200,
              onTap: () {
                groupValue.value = 1200;
                startSecond.value = 1200;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 1200;
              },
              isSelected: groupValue.value == 1200,
            ),

            RadioWithTextWidget(
              title: '30 минут',
              value: 1800,
              onTap: () {
                groupValue.value = 1800;
                startSecond.value = 1800;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 1800;
              },
              isSelected: groupValue.value == 1800,
            ),

            RadioWithTextWidget(
              title: '40 минут',
              value: 2400,
              onTap: () {
                groupValue.value = 2400;
                startSecond.value = 2400;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 2400;
              },
              isSelected: groupValue.value == 2400,
            ),

            RadioWithTextWidget(
              title: '1 час',
              value: 3600,
              onTap: () {
                groupValue.value = 3600;
                startSecond.value = 3600;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 3600;
              },
              isSelected: groupValue.value == 3600,
            ),

            RadioWithTextWidget(
              title: '2 часа',
              value: 7200,
              onTap: () {
                groupValue.value = 7200;
                startSecond.value = 7200;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 7200;
              },
              isSelected: groupValue.value == 7200,
            ),

            RadioWithTextWidget(
              title: '4 часа',
              value: 14400,
              onTap: () {
                groupValue.value = 14400;
                startSecond.value = 14400;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 14400;
              },
              isSelected: groupValue.value == 14400,
            ),

            RadioWithTextWidget(
              title: '8 часа',
              value: 28800,
              onTap: () {
                groupValue.value = 28800;
                startSecond.value = 28800;
                showDialog.value = false;
                ref.read(secondprovider.notifier).state = 28800;
              },
              isSelected: groupValue.value == 28800,
            ),
          ],
        ),
      ),
    );
  }
}
