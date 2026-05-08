import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'widgets/home_shared_widgets.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:provider/provider.dart';

class HomeMobileWeb extends StatelessWidget {
  const HomeMobileWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchBar(),
            const SizedBox(height: 24),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: Consumer<MusicPlayerProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.albums.length,
                    itemBuilder: (context, index) {
                      return NewReleaseCard(
                        album: provider.albums[index],
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            HomeSharedWidgets.buildLatestReleaseHero(context),
            const SizedBox(height: 20),
            HomeSharedWidgets.buildTourInfoPanel(context),
            const SizedBox(height: 32),
            HomeSharedWidgets.buildFavoriteTracksColumn(context),
            const SizedBox(height: 32),
            HomeSharedWidgets.buildLastPlayedColumn(context),
          ],
        ),
      ),
    );
  }
}
