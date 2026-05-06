import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:clouds/core/themes/themes.dart';

class NowPlayingSmartphone extends StatelessWidget {
  final ScrollController? scrollController;
  final VoidCallback? onCollapse;

  const NowPlayingSmartphone({
    super.key,
    this.scrollController,
    this.onCollapse,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MusicPlayerProvider>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      type: MaterialType.transparency,
      child: Stack(
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
            filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(color: AppTheme.pdark.withValues(alpha: 0.7)),
          ),

          // Foreground
          SingleChildScrollView(
            controller: scrollController,
            physics: scrollController != null
                ? const ClampingScrollPhysics()
                : const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 48.0,
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
                            size: 32,
                          ),
                          onPressed:
                              onCollapse ??
                              () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                        ),
                        const Text(
                          "NOW PLAYING",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // Center Album Art
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.5),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          provider.currentCoverArt,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.8,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.width * 0.8,
                                color: AppTheme.sdark,
                                child: const Icon(
                                  Icons.music_note,
                                  size: 64,
                                  color: Colors.white,
                                ),
                              ),
                        ),
                      ),
                    ),

                    // Metadata & Controls
                    Column(
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
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      provider.currentArtist,
                                      style: const TextStyle(
                                        color: AppTheme.newPurple,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Seek Bar
                        Column(
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 4,
                                activeTrackColor: AppTheme.newPurple,
                                inactiveTrackColor: Colors.white24,
                                thumbColor: Colors.white,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 6,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 12,
                                ),
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
                                  "1:45", // Simulated
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  provider.currentDuration,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.6),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Controls
                        if (screenHeight > 150) // Guard
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.shuffle,
                                  color: provider.isShuffled
                                      ? AppTheme.newPurple
                                      : Colors.white,
                                ),
                                onPressed: () => provider.toggleShuffle(),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {},
                              ),
                              GestureDetector(
                                onTap: () => provider.togglePlay(),
                                child: Container(
                                  width: 72,
                                  height: 72,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    provider.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.black,
                                    size: 36,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.repeat,
                                  color: provider.isRepeating
                                      ? AppTheme.newPurple
                                      : Colors.white,
                                ),
                                onPressed: () => provider.toggleRepeat(),
                              ),
                            ],
                          ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
