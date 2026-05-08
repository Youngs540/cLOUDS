import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/themes/themes.dart';
import '../core/providers/music_player_provider.dart';

class MiniPlayerBar extends StatelessWidget {
  const MiniPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to your provider for current song details
    final playerProvider = context.watch<MusicPlayerProvider>();
    // final currentSong = playerProvider.currentTrack;

    // if (currentSong == null) return const SizedBox.shrink();

    return Container(
      // margin: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(bottom: 20),
      height: 30,
      decoration: BoxDecoration(
        // In a pro app, you'd extract the dominant color from the image
        color: AppTheme.pdark,
        // borderRadius: BorderRadius.circular(12.0),
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            // 1. Album Art
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/fam.jpg',
                height: 48,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            // 2. Song Info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Odo",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Kojo Rain",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // 3. Action Buttons
            IconButton(
              icon: const Icon(
                Icons.devices_other,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                playerProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => playerProvider.togglePlay(),
            ),
          ],
        ),
      ),
    );
  }
}
