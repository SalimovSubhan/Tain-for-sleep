import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/widgets/castom_dialog_widget.dart';

class TimerScreen extends HookConsumerWidget {
  final String title;
  final String image;
  final String sound;

  const TimerScreen({
    super.key,
    required this.image,
    required this.title,
    required this.sound,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = useMemoized(() => AudioPlayer());
    final isPlying = useState<bool>(true);
    final showDialog = useState<bool>(false);
    final startSecond = useState<int>(0);
    final secondForText = useState<String?>(null);

    void formatTime({required int sec}) {
      final hour = sec ~/ 3600;
      final minute = (sec % 3600) ~/ 60;
      final sek = sec % 60;
      secondForText.value =
          '${hour ~/ 10}${hour % 10}:${minute ~/ 10}${minute % 10}:${sek ~/ 10}${sek % 10}';
    }

    useEffect(() {
      Timer? timer;
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (startSecond.value > 0) {
          startSecond.value--;
          formatTime(sec: startSecond.value);
        } else {
          secondForText.value = null;
          timer.cancel();
        }
      });
      return timer.cancel;
    }, [startSecond.value]);

    useEffect(() {
      player.setAsset(sound).then((value) {
        player.setLoopMode(LoopMode.one);
        player.play();
      });

      return player.dispose;
    }, []);

    return PopScope(
      canPop: !showDialog.value,
      onPopInvokedWithResult: (didPop, result) {
        showDialog.value = false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(149, 119, 195, 122),
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Icon(Icons.close, color: Colors.white),
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: GestureDetector(
                            onTap: () {
                              isPlying.value = !isPlying.value;
                              isPlying.value ? player.play() : player.stop();
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: Icon(
                                isPlying.value ? Icons.pause : Icons.play_arrow,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog.value = true;
                              },
                              child: Icon(
                                Icons.timer_sharp,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    secondForText.value != null
                        ? Text('${secondForText.value}')
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            showDialog.value
                ? CastomDialogWidget(
                  startSecond: startSecond,
                  showDialog: showDialog,
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
