import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/providers/providers.dart';
import 'package:rain_for_sleep/features/taimer_screen/presentation/widgets/castom_dialog_widget.dart';
import 'package:rain_for_sleep/shared/shared_aplication/audio_handler_provider.dart';

class TimerScreen extends HookConsumerWidget {
  final String title;
  final String image;
  final String sound;
  final Gradient? gradient;

  const TimerScreen({
    super.key,
    required this.image,
    required this.title,
    required this.sound,
    this.gradient,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondForText = useMemoized(() => ValueNotifier<String?>(null));
    final showCastomDialog = useState<bool>(false);
    final switchTimer = useState<int>(0);
    final groupValueForCastomDialog = useState<int?>(null);
    final volume = useState<double?>(0.0);
    var startSecond = switchTimer.value;
    Timer? timer;
    final audioHandler = ref.watch(audioHandlerProvider);

    void formatTime({required int sec}) {
      final hour = sec ~/ 3600;
      final minute = (sec % 3600) ~/ 60;
      final sek = sec % 60;
      if (sec <= 0) {
        audioHandler.stop();
        ref.read(secondprovider.notifier).state = 0;
        secondForText.value = null;
      } else if (hour > 0) {
        secondForText.value =
            '${hour ~/ 10}${hour % 10}:${minute ~/ 10}${minute % 10}:${sek ~/ 10}${sek % 10}';
      } else {
        secondForText.value =
            '${minute ~/ 10}${minute % 10}:${sek ~/ 10}${sek % 10}';
      }
    }

    useEffect(() {
      FlutterVolumeController.addListener((value) {
        volume.value = value;
      });
      audioHandler
          .customAction('setSource', {'assetPath': sound, 'title': title})
          .then((_) {
            audioHandler.play();
          });
      return null;
    }, []);

    useEffect(() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (startSecond > 0) {
          startSecond--;
          formatTime(sec: startSecond);
        }
      });
      return () {
        timer?.cancel();
      };
    }, [switchTimer.value]);

    return PopScope(
      canPop: !showCastomDialog.value,
      onPopInvokedWithResult: (didPop, result) {
        if (showCastomDialog.value) {
          showCastomDialog.value = false;
        } else {
          audioHandler.stop();
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Stack(
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
                                audioHandler.stop();
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const Icon(
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
                          color: const Color.fromARGB(255, 36, 152, 247),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Slider(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        value: volume.value ?? 0.0,
                        min: 0.0,
                        max: 1.0,
                        thumbColor: Colors.white,
                        inactiveColor: const Color.fromARGB(115, 255, 255, 255),
                        activeColor: Colors.white,
                        onChanged: (value) {
                          FlutterVolumeController.setVolume(value);
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: StreamBuilder(
                              stream: audioHandler.playbackState,
                              builder: (context, snapshot) {
                                final isPlaying =
                                    snapshot.data?.playing ?? false;
                                return GestureDetector(
                                  onTap: () {
                                    if (isPlaying) {
                                      audioHandler.pause();
                                    } else {
                                      audioHandler.play();
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showCastomDialog.value = true;
                                },
                                child: const Icon(
                                  Icons.timer_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ValueListenableBuilder(
                        valueListenable: secondForText,
                        builder: (context, value, child) {
                          return value != null
                              ? Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              showCastomDialog.value
                  ? CastomDialogWidget(
                    groupValueForCastomDialog: groupValueForCastomDialog,
                    showCastomDialog: showCastomDialog,
                    switchTimer: switchTimer,
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
