import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

Future<AudioHandler> initAudioService() async {
  return AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.yourapp.sleep.audio',
      androidNotificationChannelName: 'Sleep Sounds',
      androidNotificationOngoing: true,
    ),
  );
}

class MyAudioHandler extends BaseAudioHandler with SeekHandler {
  MyAudioHandler() {
    _init();
  }

  final _player = AudioPlayer();
  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    _player.playerStateStream.listen((state) {
      playbackState.add(
        playbackState.value.copyWith(
          controls: [
            if (state.playing) MediaControl.pause else MediaControl.play,
            MediaControl.stop,
          ],

          playing: state.playing,
          processingState:
              {
                ProcessingState.idle: AudioProcessingState.idle,
                ProcessingState.loading: AudioProcessingState.loading,
                ProcessingState.buffering: AudioProcessingState.buffering,
                ProcessingState.ready: AudioProcessingState.ready,
                ProcessingState.completed: AudioProcessingState.completed,
              }[state.processingState]!,
        ),
      );
    });
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    try {
      if (name == 'setSource') {
        final titleKey = extras?['titleKey'] as String;
        final sound = extras?['sound'] as String;
        // final image = extras?['image'] as String;

        final session = await AudioSession.instance;
        await session.configure(const AudioSessionConfiguration.music());

        mediaItem.add(
          MediaItem(
            id: sound,
            title: titleKey,
            artist: 'Rain for sleep',
            duration: null,
          ),
        );

        await _player.setAsset(sound);

        await _player.setVolume(1);
        await _player.setLoopMode(LoopMode.one);
        await _player.play();
      }
    } on PlayerException catch (e) {
      debugPrint('$e');
    }
  }
}
