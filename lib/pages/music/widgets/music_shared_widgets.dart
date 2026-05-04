import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/music_player_provider.dart';

class MusicSharedWidgets {
  static Widget buildFeaturedHero(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Image.asset(
                'assets/images/fam.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(color: Colors.black.withValues(alpha: 0.3)),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Image.asset(
                'assets/images/fam.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "NEW RELEASE",
                      style: TextStyle(fontSize: 10, color: AppTheme.newPurple),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Odo",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: Text(
                      "An ethereal journey through soundscapes of the late hours...",
                      style: TextStyle(color: AppTheme.textSecondary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
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
                          "Buy Now",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.newPurple,
                          shape: const StadiumBorder(),
                        ),
                      ),
                      IconButton.outlined(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildDiscographyTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Discography",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          "Manage and explore your high-fidelity music collection.",
          style: TextStyle(color: AppTheme.textSecondary),
        ),
      ],
    );
  }

  static Widget buildDiscographyTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabLabel("Popular", false),
          _tabLabel("All Tracks", true),
          _tabLabel("Albums", false),
        ],
      ),
    );
  }

  static Widget _tabLabel(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : AppTheme.textSecondary,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (active)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  static Widget buildTrackTable(BuildContext context, {bool hideTime = false, bool hideArtist = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
                child: Text(
                  "#",
                  style: TextStyle(color: AppTheme.textSecondary),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Text(
                  "TRACK TITLE",
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
              if (!hideArtist)
                const Expanded(
                  flex: 2,
                  child: Text(
                    "ARTIST",
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              if (!hideTime)
                const SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.access_time,
                    size: 16,
                    color: AppTheme.textSecondary,
                  ),
                ),
              const SizedBox(
                width: 80,
                child: Text(
                  "PRICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.white10),
        _trackRow(context, "01", "Rum it up", "Kojo Rain", "3:45", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        _trackRow(context, "02", "Trending", "Kojo Rain", "4:12", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
        _trackRow(context, "03", "Gye", "Kojo Rain", "3:22", "\$1.29", hideTime: hideTime, hideArtist: hideArtist),
      ],
    );
  }

  static Widget _trackRow(
    BuildContext context,
    String id,
    String title,
    String artist,
    String time,
    String price, {
    bool hideTime = false,
    bool hideArtist = false,
  }) {
    return InkWell(
      onTap: () {
        context.read<MusicPlayerProvider>().playTrack(
          track: title,
          artist: artist,
          duration: time,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(id, style: const TextStyle(color: AppTheme.textSecondary)),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!hideArtist)
              Expanded(
                flex: 2,
                child: Text(
                  artist,
                  style: const TextStyle(color: AppTheme.textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (!hideTime)
              SizedBox(
                width: 60,
                child: Text(time, style: const TextStyle(color: AppTheme.textSecondary)),
              ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.selected,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  price,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
