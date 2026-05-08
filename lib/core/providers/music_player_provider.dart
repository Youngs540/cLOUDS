import 'package:flutter/foundation.dart';
import 'package:clouds/core/models/music_models.dart';

class MusicPlayerProvider extends ChangeNotifier {
  // sample data
  MusicPlayerProvider() {
    // Initialize with your actual data
    _initializeData();
  }
  void _initializeData() {
    final kojoRainAlbums = [
      Album(
        id: 'odo_album',
        title: 'Odo',
        artist: 'Kojo Rain',
        genre: 'HighLife',
        year: 2024,
        coverArt: 'assets/images/fam.jpg',
        tracks: [
          Track(
            id: '1',
            title: 'Rum it up',
            artist: 'Kojo Rain',
            duration: '3:45',
            price: '\$1.29',
          ),
          Track(
            id: '2',
            title: 'Trending',
            artist: 'Kojo Rain',
            duration: '4:12',
            price: '\$1.29',
          ),
          Track(
            id: '3',
            title: 'Gye',
            artist: 'Kojo Rain',
            duration: '3:22',
            price: '\$1.29',
          ),
          Track(
            id: '4',
            title: 'Lost Sheep',
            artist: 'Kojo Rain',
            duration: '4:05',
            price: '\$1.29',
          ),
          Track(
            id: '5',
            title: 'Im not a Leader',
            artist: 'Kojo Rain',
            duration: '5:14',
            price: '\$1.29',
          ),
          Track(
            id: '6',
            title: 'Odo',
            artist: 'Kojo Rain',
            duration: '4:32',
            price: '\$1.29',
          ),
        ],
      ),
    ];
    setAlbums(kojoRainAlbums);
  }

  bool _isPlaying = false;
  String _currentTrack = 'Odo';
  String _currentArtist = 'Kojo Rain';
  String _currentDuration = '4:32';
  String _currentCoverArt = 'assets/images/fam.jpg';

  double _progress = 0.4;
  bool _isShuffled = false;
  bool _isRepeating = false;

  // New Album fields
  final List<Album> _albums = [];
  Album? _selectedAlbum;

  // getters for new Album fields
  List<Album> get albums => _albums;
  Album? get selectedAlbum => _selectedAlbum;

  bool get isPlaying => _isPlaying;
  String get currentTrack => _currentTrack;
  String get currentArtist => _currentArtist;
  String get currentDuration => _currentDuration;
  String get currentCoverArt => _currentCoverArt;
  double get progress => _progress;
  bool get isShuffled => _isShuffled;
  bool get isRepeating => _isRepeating;

  void setSelectedAlbum(Album album) {
    _selectedAlbum = album;
    notifyListeners();
  }

  void setAlbums(List<Album> albums) {
    _albums.clear();
    _albums.addAll(albums);
    notifyListeners();
  }

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
