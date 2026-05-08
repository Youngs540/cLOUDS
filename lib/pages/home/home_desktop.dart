import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'widgets/home_shared_widgets.dart';
import 'package:clouds/core/providers/music_player_provider.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchBar(),
            const SizedBox(height: 40),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
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
            Row(
              children: [
                Expanded(flex: 3, child: HomeSharedWidgets.buildLatestReleaseHero(context)),
                const SizedBox(width: 20),
                Expanded(flex: 2, child: HomeSharedWidgets.buildTourInfoPanel(context)),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: HomeSharedWidgets.buildFavoriteTracksColumn(context)),
                const SizedBox(width: 40),
                Expanded(child: HomeSharedWidgets.buildLastPlayedColumn(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
