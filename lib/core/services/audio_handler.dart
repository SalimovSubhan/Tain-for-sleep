import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rain_for_sleep/shared/shared_data/sound_card_dto.dart';

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

    mediaItem.add(
      MediaItem(
        id: '1',
        title: 'Rain Sound',
        album: 'Sleep Sounds',
        artUri: Uri.parse('assets/images/baground_image.jpg'),
        duration: null,
      ),
    );
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  Future<void> setAudioSource({required String urlOrAsset}) async {
    await _player.setUrl(urlOrAsset);
  }

  @override
  Future<dynamic> customAction(
    String name, [
    Map<String, dynamic>? extras,
  ]) async {
    switch (name) {
      case 'setSource':
        final soundCard = extras?['soundCard'] as SoundCardDto;

        mediaItem.add(
          MediaItem(
            id: soundCard.sound,
            title: soundCard.titleKey,
            artUri: Uri.parse(soundCard.image),
            artist: 'Rain for sleep',
            duration: null,
          ),
        );
        await _player.setAudioSource(AudioSource.asset(soundCard.sound));
        await _player.setVolume(1);
        await _player.setLoopMode(LoopMode.one);
        break;
    }
  }
}
