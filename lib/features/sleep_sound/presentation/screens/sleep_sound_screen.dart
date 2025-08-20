import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/providers/providers.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/widgets/celect_timer/select_timer_widget.dart';
import 'package:rain_for_sleep/shared/shared_aplication/audio_handler_provider.dart';

class SleepSoundScreen extends HookConsumerWidget {
  final String title;
  final String image;
  final String sound;
  final Gradient? gradient;

  const SleepSoundScreen({
    super.key,
    required this.image,
    required this.title,
    required this.sound,
    this.gradient,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondForText = useMemoized(() => ValueNotifier<String?>(null));
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
          .customAction('setSource', {'assetPath': sound, 'title': title.tr()})
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
        } else {
          secondForText.value = null;
          timer.cancel();
        }
      });
      return () {
        timer?.cancel();
      };
    }, [switchTimer.value]);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        audioHandler.stop();
      },
      child: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            toolbarHeight: 80,
            leading: GestureDetector(
              onTap: () {
                context.pop();
                audioHandler.stop();
              },
              child: const Icon(Icons.close, color: Colors.white),
            ),
            centerTitle: true,
            title: Text(
              title.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
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
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      // showCastomDialog.value = true;
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return SelectTimerWidget(
                            groupValueForCastomDialog:
                                groupValueForCastomDialog,
                            switchTimer: switchTimer,
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.timer_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
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
                  const SizedBox(height: 10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: StreamBuilder(
                          stream: audioHandler.playbackState,
                          builder: (context, snapshot) {
                            final isPlaying = snapshot.data?.playing ?? false;
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
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
