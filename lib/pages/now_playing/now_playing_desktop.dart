import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:clouds/core/themes/themes.dart';

class NowPlayingDesktop extends StatelessWidget {
  const NowPlayingDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MusicPlayerProvider>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent, // Background will be handled globally or we can do it here
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Immersive Background
          Image.asset(
            provider.currentCoverArt,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: AppTheme.pdark),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(color: AppTheme.pdark.withValues(alpha: 0.8)),
          ),
          
          // Foreground
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 40),
                  onPressed: () {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Left: Album Art
                      Expanded(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 40,
                                  offset: const Offset(0, 20),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                provider.currentCoverArt,
                                width: 500,
                                height: 500,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  width: 500,
                                  height: 500,
                                  color: AppTheme.sdark,
                                  child: const Icon(Icons.music_note, size: 64, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 64),
                      
                      // Right: Controls & Lyrics
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Metadata
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.currentTrack,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          provider.currentArtist,
                                          style: const TextStyle(
                                            color: AppTheme.newPurple,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.favorite_border, color: Colors.white, size: 36),
                              ],
                            ),
                            
                            const SizedBox(height: 48),
                            
                            // Lyrics Placeholder
                            Container(
                              height: 150,
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Synchronized Lyrics", style: TextStyle(color: AppTheme.newPurple, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 16),
                                  Text("♪ When the sun goes down...", style: TextStyle(color: Colors.white, fontSize: 18)),
                                  SizedBox(height: 8),
                                  Text("♪ I think of you...", style: TextStyle(color: Colors.white70, fontSize: 18)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 48),
      
                            // Seek Bar
                            Column(
                              children: [
                                SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 6,
                                    activeTrackColor: AppTheme.newPurple,
                                    inactiveTrackColor: Colors.white24,
                                    thumbColor: Colors.white,
                                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                                  ),
                                  child: Slider(
                                    value: provider.progress,
                                    onChanged: (val) => provider.setProgress(val),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1:45",
                                      style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14),
                                    ),
                                    Text(
                                      provider.currentDuration,
                                      style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
      
                            const SizedBox(height: 40),
      
                            // Controls
                            if (screenHeight > 150)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.shuffle,
                                      color: provider.isShuffled ? AppTheme.newPurple : Colors.white,
                                    ),
                                    iconSize: 28,
                                    onPressed: () => provider.toggleShuffle(),
                                  ),
                                  const SizedBox(width: 32),
                                  IconButton(
                                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                                    iconSize: 56,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 32),
                                  GestureDetector(
                                    onTap: () => provider.togglePlay(),
                                    child: Container(
                                      width: 96,
                                      height: 96,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        provider.isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.black,
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 32),
                                  IconButton(
                                    icon: const Icon(Icons.skip_next, color: Colors.white),
                                    iconSize: 56,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 32),
                                  IconButton(
                                    icon: Icon(
                                      Icons.repeat,
                                      color: provider.isRepeating ? AppTheme.newPurple : Colors.white,
                                    ),
                                    iconSize: 28,
                                    onPressed: () => provider.toggleRepeat(),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
