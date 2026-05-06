import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';

class HomeSharedWidgets {
  static Widget buildFavoriteTracksColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favorite Tracks", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 24),
        buildTrackTile(
          context: context,
          number: "01",
          title: "Odo",
          artist: "Kojo Rain",
          duration: "4:32",
        ),
        buildTrackTile(
          context: context,
          number: "02",
          title: "Lost Sheep",
          artist: "Kojo Rain",
          duration: "3:58",
        ),
        buildTrackTile(
          context: context,
          number: "03",
          title: "Im not a Leader",
          artist: "Kojo Rain",
          duration: "5:14",
        ),
      ],
    );
  }

  static Widget buildLastPlayedColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Tracks Played",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 24),
        buildTrackTile(
          context: context,
          number: "01",
          title: "Odo",
          artist: "Kojo Rain",
          duration: "4:32",
        ),
        buildTrackTile(
          context: context,
          number: "02",
          title: "Lost Sheep",
          artist: "Kojo Rain",
          duration: "3:58",
        ),
        buildTrackTile(
          context: context,
          number: "03",
          title: "Im not a Leader",
          artist: "Kojo Rain",
          duration: "5:14",
        ),
      ],
    );
  }

  static Widget buildTrackTile({
    required BuildContext context,
    required String number,
    required String title,
    required String artist,
    required String duration,
  }) {
    return InkWell(
      onTap: () {
        context.read<MusicPlayerProvider>().playTrack(
          track: title,
          artist: artist,
          duration: duration,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Text(
              number,
              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
            ),
            const SizedBox(width: 16),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.selected,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.music_note,
                color: AppTheme.textSecondary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$artist • $duration",
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.favorite_border,
              color: AppTheme.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildLatestReleaseHero(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 340),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Image.asset('assets/images/fam.jpg', fit: BoxFit.cover),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(color: Colors.black.withValues(alpha: 0.3)),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/fam.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      "LATEST RELEASE",
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      "Odo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<MusicPlayerProvider>().playTrack(
                              track: 'Odo',
                              artist: 'Kojo Rain',
                              duration: '4:32',
                            );
                          },
                          icon: const Icon(Icons.play_arrow, color: Colors.black),
                          label: const Text(
                            "LISTEN NOW",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.newPurple,
                            shape: const StadiumBorder(),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white54),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            "SAVE TO PLAYLIST",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildTourInfoPanel(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.sdark,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Tour",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Text(
            "Nov 24, 2024",
            style: TextStyle(color: AppTheme.textSecondary),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.selected,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Odo Concert",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Atmospheric Mix",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "GET EARLY ACCESS",
                style: TextStyle(
                  color: AppTheme.newPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
