import 'package:audio_service/audio_service.dart';
import 'package:rain_for_sleep/core/services/audio_handler.dart';

AudioHandler? _singletonHandler;

Future<AudioHandler> getAudioHandlerInstance() async {
  if (_singletonHandler != null) return _singletonHandler!;
  _singletonHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.yourapp.sleep.audio',
      androidNotificationChannelName: 'Sleep Sounds',
      androidNotificationOngoing: true,
    ),
  );
  return _singletonHandler!;
}
