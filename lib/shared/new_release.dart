import 'package:clouds/core/models/music_models.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:clouds/pages/now_playing/now_playing_view.dart';
import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:provider/provider.dart';

class NewReleaseCard extends StatelessWidget {
  final Album album;

  const NewReleaseCard({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () {
          context.read<MusicPlayerProvider>().setSelectedAlbum(album);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NowPlayingView()),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          width: 320,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.sdark, // #212121
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Placeholder for Album Art
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  album.coverArt,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.selected, // #2A2A2A
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.music_note,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Metadata
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      album.title,
                      style: AppTheme.darkTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${album.artist} • ${album.genre}",
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(
                          Icons.play_circle_outline,
                          color: AppTheme.newPurple,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "PLAY NOW",
                          style: TextStyle(
                            color: AppTheme.newPurple,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
