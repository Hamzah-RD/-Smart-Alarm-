import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  static Future playAlarmSound() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource('alarm.mp3'));
  }

  static Future stopAlarmSound() async {
    await _player.stop();
  }
}