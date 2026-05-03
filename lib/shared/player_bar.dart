import 'package:clouds/core/themes/themes.dart';
import 'package:flutter/material.dart';

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      color: AppTheme.pdark,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // 1. Current Track Info
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.selected, // Fallback color
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/album_art.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // This prevents the app from crashing if the file is missing
                  return const Icon(
                    Icons.music_note,
                    color: AppTheme.textSecondary,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Odo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Kojo Rain",
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 24),
          const Icon(
            Icons.favorite_border,
            color: AppTheme.textSecondary,
            size: 20,
          ),

          // 2. CENTER SECTION (Flexible)
          Expanded(
            flex: 3,
            child: FittedBox(
              // 1. Added FittedBox to scale content down if window is too short
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ), // 2. Add a small buffer padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Playback Controls Row
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shuffle,
                          color: AppTheme.textSecondary,
                          size: 18,
                        ),
                        SizedBox(width: 24),
                        Icon(
                          Icons.skip_previous,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 24),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 24),
                        Icon(Icons.skip_next, color: Colors.white, size: 24),
                        SizedBox(width: 24),
                        Icon(
                          Icons.repeat,
                          color: AppTheme.textSecondary,
                          size: 18,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Progress Bar Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // 3. Ensure Row takes minimum horizontal space
                        children: [
                          const Text(
                            "1:45",
                            style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 10,
                            ),
                          ),
                          // Use a fixed width for the progress bar when scaled down
                          Container(
                            width:
                                200, // Provides a stable width for the FittedBox calculation
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: LinearProgressIndicator(
                              value: 0.4,
                              backgroundColor: AppTheme.selected,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.newPurple,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              minHeight: 3,
                            ),
                          ),
                          const Text(
                            "4:32",
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
            ),
          ),
          // 3. Volume
          const Icon(
            Icons.volume_up_outlined,
            color: AppTheme.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
