import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'widgets/music_shared_widgets.dart';

class MusicTablet extends StatelessWidget {
  const MusicTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopSearchBar(),
                const SizedBox(height: 32),
                MusicSharedWidgets.buildFeaturedHero(context),
                const SizedBox(height: 40),
                // Tablet: stack the discography header elements
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MusicSharedWidgets.buildDiscographyTitle(),
                    const SizedBox(height: 24),
                    MusicSharedWidgets.buildDiscographyTabs(),
                  ],
                ),
                const SizedBox(height: 24),
                MusicSharedWidgets.buildTrackTable(context, hideTime: false, hideArtist: false),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
