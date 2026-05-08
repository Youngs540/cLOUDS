class Track {
  final String id;
  final String title;
  final String artist;
  final String duration;
  final String price;
  final String? coverArt;

  const Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.price,
    this.coverArt,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      duration: json['duration'] as String,
      price: json['price'] as String,
      coverArt: json['coverArt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'duration': duration,
      'price': price,
      'coverArt': coverArt,
    };
  }
}

class Album {
  final String id;
  final String title;
  final String artist;
  final String genre;
  final int year;
  final String coverArt;
  final List<Track> tracks;

  const Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.genre,
    required this.year,
    required this.coverArt,
    required this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      genre: json['genre'] as String,
      year: json['year'] as int,
      coverArt: json['coverArt'] as String,
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'genre': genre,
      'year': year,
      'coverArt': coverArt,
      'tracks': tracks.map((e) => e.toJson()).toList(),
    };
  }
}
