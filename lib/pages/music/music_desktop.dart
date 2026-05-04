import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'widgets/music_shared_widgets.dart';

class MusicDesktop extends StatelessWidget {
  const MusicDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopSearchBar(),
                const SizedBox(height: 32),
                MusicSharedWidgets.buildFeaturedHero(context),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MusicSharedWidgets.buildDiscographyTitle(),
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
