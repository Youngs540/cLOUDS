import 'package:flutter/foundation.dart';

class MusicPlayerProvider extends ChangeNotifier {
  bool _isPlaying = false;
  String _currentTrack = 'Odo';
  String _currentArtist = 'Kojo Rain';
  String _currentDuration = '4:32';
  String _currentCoverArt = 'assets/images/fam.jpg';

  double _progress = 0.4;
  bool _isShuffled = false;
  bool _isRepeating = false;

  bool get isPlaying => _isPlaying;
  String get currentTrack => _currentTrack;
  String get currentArtist => _currentArtist;
  String get currentDuration => _currentDuration;
  String get currentCoverArt => _currentCoverArt;
  double get progress => _progress;
  bool get isShuffled => _isShuffled;
  bool get isRepeating => _isRepeating;

  void togglePlay() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void toggleShuffle() {
    _isShuffled = !_isShuffled;
    notifyListeners();
  }

  void toggleRepeat() {
    _isRepeating = !_isRepeating;
    notifyListeners();
  }

  void setProgress(double value) {
    _progress = value;
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
    _progress = 0.0;
    if (coverArt != null) {
      _currentCoverArt = coverArt;
    }
    _isPlaying = true;
    notifyListeners();
  }
}
