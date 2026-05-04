import 'package:flutter/foundation.dart';

class MusicPlayerProvider extends ChangeNotifier {
  bool _isPlaying = false;
  String _currentTrack = 'Odo';
  String _currentArtist = 'Kojo Rain';
  String _currentDuration = '4:32';
  String _currentCoverArt = 'assets/images/fam.jpg';

  bool get isPlaying => _isPlaying;
  String get currentTrack => _currentTrack;
  String get currentArtist => _currentArtist;
  String get currentDuration => _currentDuration;
  String get currentCoverArt => _currentCoverArt;

  void togglePlay() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void playTrack({
    required String track,
    required String artist,
    required String duration,
    String? coverArt,
  }) {
    _currentTrack = track;
    _currentArtist = artist;
    _currentDuration = duration;
    if (coverArt != null) {
      _currentCoverArt = coverArt;
    }
    _isPlaying = true;
    notifyListeners();
  }
}
