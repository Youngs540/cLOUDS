import 'package:flutter/material.dart';
import 'package:clouds/shared/searchbar.dart';
import 'package:clouds/shared/new_release.dart';
import 'widgets/home_shared_widgets.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchBar(),
            const SizedBox(height: 32),
            Text("New Release", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  NewReleaseCard(title: 'odo', artisteName: 'Kojo Rain', genre: 'HighLife'),
                  NewReleaseCard(title: 'Lost Sheep', artisteName: 'Kojo Rain', genre: 'Rap'),
                  NewReleaseCard(title: 'Im not a Leader', artisteName: 'Kojo Rain', genre: 'HipLife'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tablet specific layout: Stack the Hero and Tour Panel
            HomeSharedWidgets.buildLatestReleaseHero(context),
            const SizedBox(height: 20),
            HomeSharedWidgets.buildTourInfoPanel(context),
            const SizedBox(height: 40),
            // Side-by-side tracks if width permits, or stack
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: HomeSharedWidgets.buildFavoriteTracksColumn(context)),
                const SizedBox(width: 20),
                Expanded(child: HomeSharedWidgets.buildLastPlayedColumn(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
