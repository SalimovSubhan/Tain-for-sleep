import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/providers/providers.dart';
import 'package:rain_for_sleep/features/sleep_sound/presentation/widgets/celect_timer/select_timer_widget.dart';
import 'package:rain_for_sleep/shared/shared_aplication/audio_handler_provider.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';

class SleepSoundScreen extends HookConsumerWidget {
  final SoundCardDto soundCard;

  const SleepSoundScreen({super.key, required this.soundCard});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secondForText = useState<String?>(null);
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
      () async {
        FlutterVolumeController.addListener((value) {
          volume.value = value;
        });

        await Permission.notification.request();

        try {
          await audioHandler.customAction('setSource', {
            'titleKey': soundCard.titleKey,
            'sound': soundCard.sound,
            'image': soundCard.image,
          });
        } catch (e) {
          print(e);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to load audio $e'.tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }();

      return () {
        FlutterVolumeController.removeListener();
      };
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
        decoration: BoxDecoration(gradient: soundCard.gradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: Container(
              margin: const EdgeInsets.only(left: 16, top: 8),
              child: CircleAvatar(
                backgroundColor: Colors.black.withAlpha(76),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                    audioHandler.stop();
                  },
                  icon: const Icon(Icons.close, color: Colors.white, size: 22),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),

            title: Text(
              soundCard.titleKey.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.5,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  //image
                  Container(
                    width: double.infinity,
                    height: 300,
                    margin: const EdgeInsets.only(top: 20, bottom: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(76), // 0.3 * 255 ≈ 76
                          blurRadius: 30,
                          spreadRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: AnimatedScale(
                        scale: 0.98,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          soundCard.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),

                  // timer
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withAlpha(178),
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.all(20),
                            child: SelectTimerWidget(
                              groupValueForCastomDialog:
                                  groupValueForCastomDialog,
                              switchTimer: switchTimer,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withAlpha(51),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          ValueListenableBuilder(
                            valueListenable: secondForText,
                            builder: (context, value, child) {
                              return Text(
                                value ?? 'Set Timer'.tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // volume
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.volume_down_rounded,
                            color: Colors.white.withAlpha(178),
                            size: 22,
                          ),
                          Icon(
                            Icons.volume_up_rounded,
                            color: Colors.white.withAlpha(178),
                            size: 22,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                            disabledThumbRadius: 8,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 20,
                          ),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white.withAlpha(51),
                          thumbColor: Colors.white,
                          overlayColor: Colors.white.withAlpha(25),
                        ),
                        child: Slider(
                          value: volume.value ?? 0.0,
                          min: 0.0,
                          max: 1.0,
                          onChanged: (value) {
                            FlutterVolumeController.setVolume(value);
                          },
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // button
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder(
                          stream: audioHandler.playbackState,
                          builder: (context, snapshot) {
                            final isPlaying = snapshot.data?.playing ?? false;
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(76),
                                    blurRadius: 15,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    if (isPlaying) {
                                      audioHandler.pause();
                                    } else {
                                      audioHandler.play();
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors:
                                            isPlaying
                                                ? [
                                                  const Color(0xFF667EEA),
                                                  const Color(0xFF764BA2),
                                                ]
                                                : [
                                                  const Color(0xFF4CAF50),
                                                  const Color(0xFF2E7D32),
                                                ],
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isPlaying
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
