import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:clouds/core/themes/themes.dart';

class NowPlayingTablet extends StatelessWidget {
  const NowPlayingTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MusicPlayerProvider>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Immersive Background
          Image.asset(
            provider.currentCoverArt,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: AppTheme.pdark),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: AppTheme.pdark.withValues(alpha: 0.75)),
          ),

          // Foreground
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 36,
                            ),
                            onPressed: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                          const Text(
                            "NOW PLAYING",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Center: Album Art
                      Center(
                        child: Container(
                          width: screenWidth * 0.7,
                          height: screenWidth * 0.7,
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                            maxHeight: 400,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 40,
                                offset: const Offset(0, 20),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: Image.asset(
                              provider.currentCoverArt,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    color: AppTheme.sdark,
                                    child: const Icon(
                                      Icons.music_note,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Metadata
                      Column(
                        children: [
                          Text(
                            provider.currentTrack,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              provider.currentArtist,
                              style: const TextStyle(
                                color: AppTheme.newPurple,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Seek Bar
                      Column(
                        children: [
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              activeTrackColor: AppTheme.newPurple,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: Colors.white,
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 16,
                              ),
                            ),
                            child: Slider(
                              value: provider.progress,
                              onChanged: (val) => provider.setProgress(val),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1:45",
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  provider.currentDuration,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Controls
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.shuffle,
                                color: provider.isShuffled
                                    ? AppTheme.newPurple
                                    : Colors.white,
                              ),
                              iconSize: 32,
                              onPressed: () => provider.toggleShuffle(),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                              ),
                              iconSize: 64,
                              onPressed: () {},
                            ),
                            GestureDetector(
                              onTap: () => provider.togglePlay(),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  provider.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.black,
                                  size: 45,
                                  key: const ValueKey('play_pause_icon'),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              ),
                              iconSize: 64,
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.repeat,
                                color: provider.isRepeating
                                    ? AppTheme.newPurple
                                    : Colors.white,
                              ),
                              iconSize: 32,
                              onPressed: () => provider.toggleRepeat(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Lyrics Placeholder
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Synchronized Lyrics",
                              style: TextStyle(
                                color: AppTheme.newPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "♪ When the sun goes down...",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "♪ I think of you...",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
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
          ),
        ],
      ),
    );
  }
}
