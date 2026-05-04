import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'widgets/music_shared_widgets.dart';

class MusicSmartphone extends StatelessWidget {
  const MusicSmartphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopSearchBar(),
                const SizedBox(height: 24),
                MusicSharedWidgets.buildFeaturedHero(context),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MusicSharedWidgets.buildDiscographyTitle(),
                    const SizedBox(height: 16),
                    MusicSharedWidgets.buildDiscographyTabs(),
                  ],
                ),
                const SizedBox(height: 24),
                // Hide Time and Artist to avoid overflow on small screens
                MusicSharedWidgets.buildTrackTable(context, hideTime: true, hideArtist: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
